# Provenance and publication changes

The October 4 source archive, October 11 documentation update and October 21 final edited Word report have different roles. Current presentation combines them without relabelling historical observations as new experiments.

| Input | SHA-256 |
|---|---|
| Original uppercase-UI source ZIP | `d6c6f0ca1512ad82debef444a75adcd3ac3cf7e8e994a34897a7f1c754724198` |
| October 11 documentation ZIP | `418d36f53cdcfce28fdf71850a0a0fdde2fd4f5acaf129de0b7037b6abc63302` |

All 470 original manifest-controlled files were verified before publication work. Their original integrity indexes are unchanged under [original-package](provenance/original-package). Those indexes describe the original ZIP layout, including its historical dist assets; they are not indexes of this publication tree.

[source-selection.json](provenance/source-selection.json) records original location, destination, byte size, SHA-256 and category for copied source/evidence. [recovered-deliverables.json](provenance/recovered-deliverables.json) records exact approved document/archive digests. `PUBLICATION_MANIFEST.json` independently describes the new Git selection and excludes its own hash.

## Reviewed changes

1. Add evidence-led README, contributor links, guides, screenshot catalogue, original-asset extraction and minimal CI/contribution metadata.
2. Preserve all 17 original VHDL files byte-for-byte, all 93 benchmark trace/log pairs, saved GHDL/XSim records, raw Vivado reports and existing public data copy chains.
3. Patch only frontend Vite from 8.3.2 to exact 8.3.5 and regenerate its lockfile. npm audit identified a high Windows development-server advisory in the baseline version. The reviewed patch removes the reported findings; it does not change RTL. TypeScript remains 7.0.2. Original source ZIP bytes remain unchanged.
4. Keep generated dist, node_modules, working simulator builds, repository.bundle and duplicate document binaries out of ordinary Git. Complete historical archives and the approved current Word documents are release assets.
5. Extract 42 screenshot images directly from the supplied all-screenshot Word file; extract 18 current figures directly from the approved final report. No figure was regenerated to manufacture evidence. Corrected hierarchy, datapath and scoreboard figures supersede older illustrations for current navigation.
6. Replace stale workflow/status navigation with scoped current guidance. Historical files under evidence/provenance remain historical records.

The report, source printout and screenshot Word files are distributed unchanged. No code-page reformatting, PRN change, extra license grant, signature or fictional co-authorship is introduced.

New portable publication validation uses Node 24.22.1, npm 11.9.0 and GHDL 4.1.0 in a disposable copy. Hosted workflow logs record the runner's installed simulator independently. Fresh GitHub checkouts and independent release-asset downloads provide publication acceptance, rather than simply trusting a successful upload.
