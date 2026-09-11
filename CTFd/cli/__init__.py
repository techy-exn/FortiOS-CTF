import datetime
import shutil
from pathlib import Path

import click
from flask import Blueprint

from CTFd.utils import get_config as get_config_util
from CTFd.utils import set_config as set_config_util
from CTFd.utils.config import ctf_name
from CTFd.utils.exports import export_ctf as export_ctf_util
from CTFd.utils.exports import import_ctf as import_ctf_util
from CTFd.utils.exports import set_import_end_time, set_import_error

_cli = Blueprint("cli", __name__)


BUILD_COMMANDS = {}


@_cli.cli.command("get_config")
@click.argument("key")
def get_config(key):
    print(get_config_util(key))


@_cli.cli.command("set_config")
@click.argument("key")
@click.argument("value")
def set_config(key, value):
    print(set_config_util(key, value).value)


@_cli.cli.command("build")
@click.argument("cmd")
def build(cmd):
    cmd = BUILD_COMMANDS.get(cmd)
    cmd()


@_cli.cli.command("export_ctf")
@click.argument("path", default="")
def export_ctf(path):
    backup = export_ctf_util()

    if path:
        with open(path, "wb") as target:
            shutil.copyfileobj(backup, target)
    else:
        name = ctf_name()
        day = datetime.datetime.now().strftime("%Y-%m-%d_%T")
        full_name = f"{name}.{day}.zip"

        with open(full_name, "wb") as target:
            shutil.copyfileobj(backup, target)

        print(f"Exported {full_name}")


@_cli.cli.command("import_ctf")
@click.argument("path", type=click.Path(exists=True))
@click.option(
    "--delete_import_on_finish",
    default=False,
    is_flag=True,
    help="Delete import file when import is finished",
)
def import_ctf(path, delete_import_on_finish=False):
    try:
        import_ctf_util(path)
    except Exception as e:
        from CTFd.utils.dates import unix_time

        set_import_error("Import Failure: " + str(e))
        set_import_end_time(value=unix_time(datetime.datetime.utcnow()))

    if delete_import_on_finish:
        print(f"Deleting {path}")
        Path(path).unlink()


@_cli.cli.command("sync-content")
@click.option(
    "--prune",
    default=False,
    is_flag=True,
    help="Delete challenges that no longer have a file in data/",
)
@click.option(
    "--no-overwrite",
    default=False,
    is_flag=True,
    help="Only create missing challenges; leave existing ones untouched",
)
def sync_content(prune=False, no_overwrite=False):
    """Import the data/ directory into the database.

    Challenge text, categories, ordering and flags are read from the Markdown
    files in data/. Run this after editing content.
    """
    from CTFd.utils.content import sync_content as sync_content_util

    summary = sync_content_util(prune=prune, overwrite=not no_overwrite)

    print("Content synchronised from data/:")
    print(f"  challenges created : {summary['challenges_created']}")
    print(f"  challenges updated : {summary['challenges_updated']}")
    print(f"  pages created      : {summary['pages_created']}")
    print(f"  pages updated      : {summary['pages_updated']}")
    print(f"  links applied      : {summary.get('links', 0)}")
    print(f"  skipped            : {summary['skipped']}")
    if prune:
        print(f"  pruned             : {summary['pruned']}")

    warnings = summary.get("warnings") or []
    if warnings:
        print("")
        print("Warnings:")
        for warning in warnings:
            print(f"  ! {warning}")


@_cli.cli.command("list-content")
def list_content():
    """Show what the data/ directory currently defines, without importing."""
    from CTFd.utils.content import discover_content

    items = discover_content()
    print(f"{'ORDER':>7}  {'KIND':9} {'CATEGORY':22} {'TITLE':30} {'FLAG':8} LINKS")
    print("-" * 110)
    for item in items:
        kind = "page" if item["is_page"] else "challenge"
        links = []
        if item.get("requires"):
            links.append("requires " + ", ".join(item["requires"]))
        if item.get("next"):
            links.append("next " + item["next"])
        print(
            f"{item['order']:>7}  {kind:9} {item['category'][:22]:22} "
            f"{item['title'][:30]:30} {item['flag_type']:8} {'; '.join(links)}"
        )
