# Reproduce without replacing the baseline

Use Node 24 (publication checked with 24.22.1) and npm. The frontend lockfile pins Vite 8.3.5 and TypeScript 7.0.2. The original October 4 ZIP pins Vite 8.3.2; that archived dependency is preserved as historical material rather than recommended for serving.

## Integrity and archived records

```powershell
node .\scripts\verify_publication.mjs
node .\scripts\verify_evidence.mjs
```

The first uses `PUBLICATION_MANIFEST.json`; the second validates original VHDL/benchmark hashes, 14 saved GHDL logs, 14 saved XSim logs, report provenance and bundled dashboard copies. The original package's 470-file indexes remain under `docs/provenance/original-package` and refer to the unchanged source ZIP, not the reorganized publication tree.

## New portable simulations

The historical runner writes into `build/ghdl` and `evidence/ghdl`. Use a disposable checkout:

```powershell
git clone . ..\NoC-Verification
Set-Location ..\NoC-Verification
node .\scripts\run_ghdl.mjs
```

GHDL must be on PATH; alternatively set `$env:GHDL` to its executable for this process. The runner analyzes the compile-order RTL and six testbenches, elaborates them, then runs fourteen configurations. It rejects nonzero status and missing PASS markers. The original suite's GHDL 6.0.0 provenance is distinct from a new run with another compatible GHDL. No `--help` flag is implemented.

## Separate 93-run experiment

After a successful portable run in that disposable checkout:

```powershell
node .\experiments\run_experiments.mjs
```

This executes 93 configurations and replaces `experiments/results` metrics/traces/logs in the disposable copy. It uses depths 4,2,8; scenarios no_load, disjoint, burst, sustained, all_to_all, hotspot and sink_stall; seeds 101/202/303 where configured. Warm-up=100, measured window=1000, TRACE_LEVEL=2. It is separate from the fourteen supplemental tests and is not automatically rerun by ordinary CI.

Compare new results semantically with the reference. Platform paths, compiler versions and newline/log formatting can change file hashes; never update expected historical digests just to make a new run match. Keep new records under a separately labelled run before proposing a baseline change.

## Dashboard copies and manual imports

The frontend public data are fixed copies. If intentionally replacing a dataset, review and synchronize the source/copy chains. Report import accepts exactly one report folder:

```powershell
node .\scripts\import_vivado_reports.mjs .\evidence\vivado\synthesis_ooc
node .\scripts\import_vivado_reports.mjs .\evidence\vivado\route_demo_ooc
```

Do not treat an import as a new synthesis run. Unknown fields remain null and warnings/unconstrained paths need review. For new Vivado execution use the [Windows guide](implementation_guide.md).
