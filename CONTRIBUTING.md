# Contributing

Use a short branch and pull request for future changes. Explain the problem, affected module, observed behavior and validation. Keep baseline evidence immutable; new experiments need separately named output folders, tool versions, configurations and hashes. Never replace a historical expected digest simply to accept unexplained changes.

For frontend changes run `npm ci`, `npm test`, `npm run build` in `frontend`. For RTL changes run the fourteen-test GHDL suite in a disposable checkout and examine source/protocol implications before updating baseline records. Run both evidence and publication verifiers for a release. A changed VHDL source intentionally invalidates the old benchmark source hash and requires explicit new provenance.

Use actual commits and reviewed contributor identity. Do not add invented co-authored trailers to populate GitHub's graph. No project-wide license has yet been selected; discuss redistribution rights with the team before applying one.

Do not commit generated simulator libraries, node_modules, tokens, licenses, machine-specific project databases or build caches. Saved verification logs and experiment traces are intentionally tracked.
