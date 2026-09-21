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
    font-size: 1.25rem;
    flex: none;
    box-shadow: 0 6px 18px rgba(218, 41, 28, 0.30);
  }

  .fos-page__title {
    margin: 0;
    line-height: 1.1;
  }

  .fos-page__sub {
    color: #6b7280;
    margin: 0.25rem 0 1.75rem;
    max-width: 60ch;
  }

  .fos-callout {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    background: rgba(218, 41, 28, 0.06);
    border: 1px solid rgba(218, 41, 28, 0.22);
    border-left: 4px solid var(--fos-red);
    border-radius: 0.6rem;
    padding: 0.9rem 1.1rem;
    margin-bottom: 1.75rem;
    font-size: 1rem;
  }

  .fos-callout code {
    background: var(--fos-dark);
    color: #fff;
    padding: 0.15rem 0.55rem;
    border-radius: 0.35rem;
    font-weight: 700;
    letter-spacing: 0.3px;
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

  .fos-table tbody tr:nth-child(even) td {
    background: #f7f8fa;
  }

  .fos-table tbody tr:hover td {
    background: rgba(218, 41, 28, 0.05);
  }

  .fos-table td:first-child {
    font-weight: 600;
    color: var(--fos-dark);
  }

  .fos-cred {
    font-family: var(--ns-font-mono, "SFMono-Regular", Menlo, monospace);
    background: #eef0f3;
    padding: 0.15rem 0.5rem;
    border-radius: 0.35rem;
    color: #1f2430;
  }

  .fos-pill {
    display: inline-block;
    background: rgba(11, 15, 25, 0.06);
    color: #4b5563;
    border-radius: 999px;
    padding: 0.15rem 0.7rem;
    font-size: 0.85rem;
    font-weight: 600;
  }

  /* Dark theme support */
  [data-bs-theme="dark"] .fos-table { background: #12161f; }
  [data-bs-theme="dark"] .fos-table tbody td { color: #e5e7eb; border-color: rgba(255,255,255,0.08); }
  [data-bs-theme="dark"] .fos-table td:first-child { color: #fff; }
  [data-bs-theme="dark"] .fos-table tbody tr:nth-child(even) td { background: rgba(255,255,255,0.03); }
  [data-bs-theme="dark"] .fos-cred { background: rgba(255,255,255,0.08); color: #e5e7eb; }
  [data-bs-theme="dark"] .fos-page__sub { color: #9aa3b2; }
</style>

<div class="fos-page">

  <div class="fos-page__head">
    <span class="fos-page__badge"><i class="fas fa-key"></i></span>
    <h1 class="fos-page__title">Credentials</h1>
  </div>

  <p class="fos-page__sub">
    Use the <strong>Navigator</strong> to quickly reach every FortiOS 8.0 resource,
    security solution and VM in your environment.
  </p>

  <div class="fos-callout">
    <i class="fas fa-triangle-exclamation" style="color:var(--fos-red);font-size:1.15rem;"></i>
    <span>The <strong>FortiOS 8.0 password</strong> is <code>Exclusive123!</code></span>
  </div>

  <div class="fos-table-wrap">
    <table class="fos-table">
      <thead>
        <tr>
          <th>Application</th>
          <th>Authentication</th>
          <th>Username</th>
          <th>Password</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>IT Workstation 1</td>
          <td><span class="fos-pill">Password</span></td>
          <td><span class="fos-cred">Fortinet</span></td>
          <td><span class="fos-cred">Actions > Sent password</span></td>
        </tr>
        <tr>
          <td>FortiGate Edge</td>
          <td><span class="fos-pill">Password</span></td>
          <td><span class="fos-cred">admin</span></td>
          <td><span class="fos-cred">Exclusive123!</span></td>
        </tr>
        <tr>
          <td>FortiAnalyzer</td>
          <td><span class="fos-pill">Password</span></td>
          <td><span class="fos-cred">admin</span></td>
          <td><span class="fos-cred">Exclusive123!</span></td>
        </tr>
      </tbody>
    </table>
  </div>

</div>
