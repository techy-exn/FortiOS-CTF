<style>
  .fos-page {
    --fos-red: var(--ns-orange, #da291c);
    --fos-dark: var(--ns-navy, #0b0f19);
    --fos-border: rgba(11, 15, 25, 0.10);
    max-width: 960px;
    margin: 0 auto;
    padding: 1.5rem 0 3rem;
  }

  .fos-page__head {
    display: flex;
    align-items: center;
    gap: 0.9rem;
    margin-bottom: 0.75rem;
  }

  .fos-page__badge {
    display: inline-grid;
    place-items: center;
    width: 2.9rem;
    height: 2.9rem;
    border-radius: 0.75rem;
    background: var(--fos-red);
    color: #fff;
    font-size: 1.2rem;
    flex: none;
    box-shadow: 0 6px 18px rgba(218, 41, 28, 0.30);
  }

  .fos-page__title { margin: 0; line-height: 1.1; }

  .fos-page__sub {
    color: #6b7280;
    margin: 0.25rem 0 1.75rem;
    max-width: 68ch;
    line-height: 1.6;
  }

  .fos-section-title {
    display: flex;
    align-items: center;
    gap: 0.6rem;
    font-size: 1.15rem;
    font-weight: 700;
    color: var(--fos-dark);
    margin: 2rem 0 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 2px solid rgba(218, 41, 28, 0.18);
  }
  .fos-section-title i { color: var(--fos-red); }

  .fos-callout {
    background: rgba(218, 41, 28, 0.06);
    border: 1px solid rgba(218, 41, 28, 0.22);
    border-left: 4px solid var(--fos-red);
    border-radius: 0.6rem;
    padding: 1rem 1.25rem;
    margin: 1.25rem 0;
    line-height: 1.6;
  }
  .fos-callout strong { color: var(--fos-dark); }

  .fos-chips {
    display: flex;
    flex-wrap: wrap;
    gap: 0.6rem;
    margin: 1rem 0 0.5rem;
    padding: 0;
    list-style: none;
  }
  .fos-chips li {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    background: #fff;
    border: 1px solid var(--fos-border);
    border-left: 3px solid var(--fos-red);
    border-radius: 0.5rem;
    padding: 0.55rem 0.95rem;
    font-weight: 600;
    color: var(--fos-dark);
    box-shadow: 0 3px 10px rgba(11, 15, 25, 0.05);
  }
  .fos-chips li i { color: var(--fos-red); }

  .fos-table-wrap {
    overflow-x: auto;
    border-radius: 0.75rem;
    box-shadow: 0 8px 26px rgba(11, 15, 25, 0.08);
    border: 1px solid var(--fos-border);
    margin-top: 0.5rem;
  }

  .fos-table {
    border-collapse: collapse;
    width: 100%;
    background: #fff;
    font-size: 0.97rem;
  }

  .fos-table thead th {
    background: var(--fos-dark);
    color: #fff;
    text-align: left;
    font-weight: 600;
    letter-spacing: 0.4px;
    padding: 0.9rem 1.1rem;
  }

  .fos-table tbody td {
    padding: 0.85rem 1.1rem;
    border-top: 1px solid var(--fos-border);
    color: #1f2430;
    line-height: 1.5;
  }
  .fos-table tbody tr:nth-child(even) td { background: #f7f8fa; }
  .fos-table tbody tr:hover td { background: rgba(218, 41, 28, 0.05); }
  .fos-table td:first-child {
    font-weight: 700;
    color: var(--fos-dark);
    white-space: nowrap;
  }

  [data-bs-theme="dark"] .fos-table { background: #12161f; }
  [data-bs-theme="dark"] .fos-table tbody td { color: #e5e7eb; border-color: rgba(255,255,255,0.08); }
  [data-bs-theme="dark"] .fos-table td:first-child { color: #fff; }
  [data-bs-theme="dark"] .fos-table tbody tr:nth-child(even) td { background: rgba(255,255,255,0.03); }
  [data-bs-theme="dark"] .fos-page__sub,
  [data-bs-theme="dark"] .fos-section-title { color: #e5e7eb; }
  [data-bs-theme="dark"] .fos-chips li { background: rgba(255,255,255,0.04); color: #fff; border-color: rgba(255,255,255,0.10); border-left-color: var(--fos-red); }
</style>

<div class="fos-page">

  <div class="fos-page__head">
    <span class="fos-page__badge"><i class="fas fa-boxes-stacked"></i></span>
    <h1 class="fos-page__title">Inventory: Fortinet Products</h1>
  </div>

  <p class="fos-page__sub">
    An inventory of the Fortinet components used in this workshop. Every product is
    running <strong>FortiOS 8.0</strong>, and you are welcome to explore any of the
    machines you like.
  </p>

  <div class="fos-callout">
    The FortiOS 8.0 workshop is <strong>modular</strong> and <strong>scalable</strong>.
    <strong>Each session is unique</strong> &mdash; content is continuously updated and new
    features are introduced. Updates will continue in the coming years, aligned with
    future FortiOS releases.
  </div>

  <p class="fos-page__sub" style="margin-bottom:0;">
    The FortiOS environment is hosted on our <strong>Cloudshare</strong>.
  </p>

  <div class="fos-section-title"><i class="fas fa-shield-halved"></i>Fortinet products</div>

  <p class="fos-page__sub" style="margin-bottom:0.5rem;">
    An overview of the Fortinet solutions deployed in the FortiOS workshop.
  </p>

  <ul class="fos-chips">
    <li><i class="fas fa-shield-halved"></i>FortiGate</li>
    <li><i class="fas fa-chart-line"></i>FortiAnalyzer</li>
    <li><i class="fas fa-sitemap"></i>FortiManager</li>
    <li><i class="fas fa-user-shield"></i>FortiAuthenticator</li>
    <li><i class="fas fa-laptop-code"></i>FortiClient EMS</li>
    <li><i class="fas fa-key"></i>FortiPAM</li>
  </ul>

  <div class="fos-section-title"><i class="fas fa-cloud"></i>Environment</div>

  <p class="fos-page__sub">
    All tools and products live inside Cloudshare. Everyone gets a completely
    separate environment, isolated from the others.
  </p>

  <div class="fos-table-wrap">
    <table class="fos-table">
      <thead>
        <tr>
          <th style="min-width:200px;">Tool / Solution</th>
          <th>Functionality</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>NGFW</td>
          <td>Next-gen firewall with application control, IPS, threat protection and URL filtering.</td>
        </tr>
        <tr>
          <td>FortiAnalyzer</td>
          <td>Centralized logging, analytics, reporting and threat visibility for Fortinet devices.</td>
        </tr>
        <tr>
          <td>FortiManager</td>
          <td>Centralized management, policy provisioning and automation for Fortinet security devices.</td>
        </tr>
        <tr>
          <td>FortiAuthenticator</td>
          <td>Identity and access management with authentication, SSO and certificate services.</td>
        </tr>
        <tr>
          <td>FortiClient EMS</td>
          <td>Centralized endpoint management, security posture and Zero Trust access control.</td>
        </tr>
        <tr>
          <td>FortiPAM</td>
          <td>Privileged Access Management (PAM) with Secure Remote Access (SRA) for protecting privileged accounts, managing credentials, and securing vendor and administrator access to critical systems.</td>
        </tr>
      </tbody>
    </table>
  </div>

</div>
