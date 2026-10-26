# Publication and archive integrity

A normal Git checkout contains editable sources, all 93 original benchmark CSV/log pairs, saved tool evidence and 42 canonical screenshots. `PUBLICATION_MANIFEST.json` checks this selection; run `node scripts/verify_publication.mjs` and `node scripts/verify_evidence.mjs`. Generated frontend/dist and node_modules are excluded from Git.

The complete release ZIP adds the built dashboard and unchanged approved Word documents. Its `DISTRIBUTION_MANIFEST.json` lists every payload file except itself. `SHA256SUMS-release.txt` verifies downloaded release assets.

Original October 4 source and October 11 documentation ZIPs are separate, unchanged assets. Original 470-file PACKAGE_MANIFEST/SHA256SUMS and the October 11 paper source checksum file are preserved under docs/provenance and apply to their original archive layouts, not to this reorganized tree. The original repository.bundle is retained inside the source ZIP; it is not duplicated in the new Git repository.

Do not replace historical expected digests to accept new execution results. Generate new evidence in an isolated checkout and record provenance separately. See [provenance](provenance.md), [catalogue](document_catalogue.md) and [reproduction](reproducibility.md).
