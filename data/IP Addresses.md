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
    max-width: 60ch;
  }

  .fos-table-wrap {
    overflow-x: auto;
    border-radius: 0.75rem;
    box-shadow: 0 8px 26px rgba(11, 15, 25, 0.08);
    border: 1px solid var(--fos-border);
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
    white-space: nowrap;
  }

  .fos-table tbody td {
    padding: 0.85rem 1.1rem;
    border-top: 1px solid var(--fos-border);
    color: #1f2430;
  }

  .fos-table tbody tr:nth-child(even) td { background: #f7f8fa; }
  .fos-table tbody tr:hover td { background: rgba(218, 41, 28, 0.05); }

  .fos-table td:first-child {
    font-weight: 600;
    color: var(--fos-dark);
  }

  .fos-ip {
    font-family: var(--ns-font-mono, "SFMono-Regular", Menlo, monospace);
    color: var(--fos-red);
    font-weight: 600;
    text-decoration: none;
  }
  .fos-ip:hover { text-decoration: underline; }

  .fos-ip i { color: #9aa3b2; margin-right: 0.4rem; font-size: 0.85em; }

  [data-bs-theme="dark"] .fos-table { background: #12161f; }
  [data-bs-theme="dark"] .fos-table tbody td { color: #e5e7eb; border-color: rgba(255,255,255,0.08); }
  [data-bs-theme="dark"] .fos-table td:first-child { color: #fff; }
  [data-bs-theme="dark"] .fos-table tbody tr:nth-child(even) td { background: rgba(255,255,255,0.03); }
  [data-bs-theme="dark"] .fos-page__sub { color: #9aa3b2; }
</style>

<div class="fos-page">

  <div class="fos-page__head">
    <span class="fos-page__badge"><i class="fas fa-network-wired"></i></span>
    <h1 class="fos-page__title">IP Addresses</h1>
  </div>

  <p class="fos-page__sub">
    Management addresses for the Fortinet solutions in your FortiOS 8.0 lab
    environment. Open a link to reach each device's web interface.
  </p>

  <div class="fos-table-wrap">
    <table class="fos-table">
      <thead>
        <tr>
          <th>Application</th>
          <th>IP address</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>FortiDeceptor</td>
          <td><a class="fos-ip" href="https://10.60.10.50"><i class="fas fa-link"></i>https://10.60.10.50</a></td>
        </tr>
        <tr>
          <td>FortiPAM</td>
          <td><a class="fos-ip" href="https://10.60.10.40"><i class="fas fa-link"></i>https://10.60.10.40</a></td>
        </tr>
        <tr>
          <td>Guardian</td>
          <td><a class="fos-ip" href="https://10.60.10.200"><i class="fas fa-link"></i>https://10.60.10.200</a></td>
        </tr>
        <tr>
          <td>FortiGate OT</td>
          <td><a class="fos-ip" href="https://10.60.10.2"><i class="fas fa-link"></i>https://10.60.10.2</a></td>
        </tr>
      </tbody>
    </table>
  </div>

</div>
