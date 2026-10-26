# Repository checks

The [workflow](../.github/workflows/portable-checks.yml) runs three independent hosted jobs from fresh checkouts: archival integrity, frontend regression/build/audit, and new isolated GHDL tests. External actions are pinned to verified commit SHAs; versions and source links are recorded in `evidence/publication/action-pins.json`.

Jobs use read-only contents permissions. They do not deploy a site, run Vivado or access the owner's laptop. The GHDL job records the actual runner simulator version and uploads newly generated logs without overwriting the checkout's historical evidence. GitHub UI run results are authoritative for CI completion.

Use pull requests for subsequent changes. Branch protections/security features depend on the account and private-repository capabilities; settings should be reported enabled only after an observed successful save. No paid feature or public visibility change is required for using this source repository.
