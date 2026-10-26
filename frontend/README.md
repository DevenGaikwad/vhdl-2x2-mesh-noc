# NoC Trace Lab

The mission-control theme uses background #07090F, panel #10141E, green #42E5A4, red #FF7184, yellow #F3CD65 and purple #B89AFF. The architecture view combines a fabric configuration rail, eight directed mesh channels, per-router FIFO telemetry and an edge timeline. Colors reflect recorded state or selection; endpoint labels remain traffic models.

All nine views were checked at 1440-pixel desktop and 390-pixel mobile widths on production builds at both the root URL and nested `/noc-lab/` URL. Mobile navigation keeps the active tab visible. Data tables scroll inside their panels. Current captures and browser records are under `evidence/frontend/production/` and `evidence/frontend/subpath/`.

Local TypeScript/Vite application. Node 24.19.0, Vite 8.3.2, TypeScript 7.0.2; exact dependencies in package-lock.json. No Python runtime, backend, database, authentication key or FPGA connection is needed.

```powershell
cd frontend
npm ci
npm test
npm run dev
```

Open the printed localhost URL. Load the bundled **actual GHDL directed trace**, then explore all nine views. The bundled 93-run summary is measured RTL evidence. An arbitrary import is labelled user-supplied and cannot independently authenticate its simulator. Replay steps rising-edge records with no interpolation.

```powershell
npm run build
npm run preview
```

Serve `dist/` over HTTP. Opening index.html directly with file:// prevents supported module/fetch behavior. This relative-base static build can be hosted later, subject to a separate visibility/access decision. No Pages deployment or public publication is performed.

Import a schema-v1 CSV, metrics JSON, or a `vivado_report_export` JSON produced by `scripts/import_vivado_reports.mjs`. Raw reports remain authoritative. Resource fields are unavailable before a real local run. For CSV without contiguous complete pre-edge measurement-state coverage, rates are unavailable; latency/accounting can still be inspected. Full status is displayed only for the bundled trace whose depth is known; empty derives directly from recorded occupancy.

The app validates field ranges, packet/hex agreement, route/link consistency, unique accepted identities and unique completion, escaped presentation and maximum file size. It exports local JSON and never uploads files. CSV formula escaping is provided/tested for future tabular exports. There is no synthetic animation presented as RTL, physical live feed, or Web Serial implementation.
