# Security scope

Run the dashboard on the documented localhost address. Do not expose the development server as an Internet service. Restore reviewed dependencies with `npm ci`; review audit findings in context and rerun tests/build after a patch.

This repository contains VHDL and static trace visualization, not a deployed authentication service. Never add Vivado license files, credentials, personal access tokens or private board access details. Report a concern to the repository owner through an appropriate private channel; do not paste secrets into an issue.

Hosted checks use read-only contents permissions and do not execute pull requests on the owner's laptop. JavaScript dependency checking does not establish VHDL correctness. Vivado requires an independently configured tool environment.
