# ---------------------------------------------------------------------------
#  Stage 1: build the front-end themes from source with Node/Vite.
#
#  This is the important part: the compiled theme assets under
#  CTFd/themes/*/static are generated HERE, on every image build, straight
#  from the SCSS/JS/Vue source. That means you never have to run
#  `npm run build` by hand, and the server can never ship a stale bundle
#  that has drifted from the source (which is exactly what caused the
#  missing-Submit-button bug). Edit source, rebuild the image, done.
# ---------------------------------------------------------------------------
FROM node:20-bookworm-slim AS themebuild

WORKDIR /themes

# Student theme (core-beta). Copy manifests first so this layer is cached
# until the dependencies actually change.
COPY CTFd/themes/core-beta/package.json CTFd/themes/core-beta/package-lock.json* CTFd/themes/core-beta/yarn.lock* ./core-beta/
RUN cd core-beta && npm install --no-audit --no-fund
COPY CTFd/themes/core-beta ./core-beta
RUN cd core-beta && npm run build

# Admin theme.
COPY CTFd/themes/admin/package.json CTFd/themes/admin/package-lock.json* CTFd/themes/admin/yarn.lock* ./admin/
RUN cd admin && npm install --no-audit --no-fund
COPY CTFd/themes/admin ./admin
RUN cd admin && npm run build


# ---------------------------------------------------------------------------
#  Stage 2: install Python dependencies.
# ---------------------------------------------------------------------------
FROM python:3.11-slim-bookworm AS build

WORKDIR /opt/CTFd

# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libffi-dev \
        libssl-dev \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && python -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

COPY . /opt/CTFd

RUN pip install --no-cache-dir -r requirements.txt \
    && for d in CTFd/plugins/*; do \
        if [ -f "$d/requirements.txt" ]; then \
            pip install --no-cache-dir -r "$d/requirements.txt";\
        fi; \
    done;


# ---------------------------------------------------------------------------
#  Stage 3: the runtime image.
# ---------------------------------------------------------------------------
FROM python:3.11-slim-bookworm AS release
WORKDIR /opt/CTFd

# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libffi8 \
        libssl3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --chown=1001:1001 . /opt/CTFd

# Overlay the freshly-compiled theme assets, replacing whatever static/ files
# happened to be committed. The templates come from the source copied above;
# only the built static/ output is taken from the themebuild stage.
COPY --chown=1001:1001 --from=themebuild /themes/core-beta/static /opt/CTFd/CTFd/themes/core-beta/static
COPY --chown=1001:1001 --from=themebuild /themes/admin/static     /opt/CTFd/CTFd/themes/admin/static

RUN useradd \
    --no-log-init \
    --shell /bin/bash \
    -u 1001 \
    ctfd \
    && mkdir -p /var/log/CTFd /var/uploads \
    && chown -R 1001:1001 /var/log/CTFd /var/uploads /opt/CTFd \
    && chmod +x /opt/CTFd/docker-entrypoint.sh

COPY --chown=1001:1001 --from=build /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

USER 1001
EXPOSE 8000
ENTRYPOINT ["/opt/CTFd/docker-entrypoint.sh"]
