# Dashboard demonstration

The browser is a viewer of recorded RTL output. The actual packet-transfer behavior originates in VHDL testbenches and their simulator logs/CSV events. Static imported reports supply resource rows. There is no live FPGA connection or server-side HDL execution.

1. From `frontend`, run `npm ci`, then `npm run dev -- --host 127.0.0.1 --port 5173 --strictPort`.
2. Open http://127.0.0.1:5173/ and load a bundled directed trace.
3. Pause playback. Choose an edge and select a transaction in the event table. A changing transaction number while playback runs is the selected time/event changing, not packet corruption.
4. Follow injection, link and ejection events for the same transaction. Green links indicate accepted transfers in the CSV; route overlays and selected packet paths are visual explanations.
5. Compare packet source/destination/ID/payload. For ready/valid, inspect each relevant endpoint bit; hexadecimal vector `F` means all four bits high.
6. Open verification evidence to view the bundled test index. It describes a fixed RTL revision, not an arbitrary uploaded trace's authenticity.
7. Open resource evidence for the two measured rows: archived core synthesis and routed finite demo wrapper. Their tops differ and must not be treated as identical circuits.

The parser rejects malformed coordinates/fields, mixed run IDs, duplicate deliveries and non-XY linked packet motion. Its 22 tests also cover CRLF, CSV quoting, partial traces, reset accounting, rate denominator coverage and safe CSV formula export. Parser consistency is useful but does not replace RTL simulation.

Historical screenshot captures under `evidence/frontend` record desktop/mobile views and earlier frontend states. The current uppercase styling is preserved in `frontend/src/style.css`; no source text, packet values or HDL behavior was uppercased as part of publication. Vite was patched from 8.3.2 to 8.3.5 with test/build verification.
