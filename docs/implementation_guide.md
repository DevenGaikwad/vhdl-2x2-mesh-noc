# Windows and Vivado execution

The original lab source is `D:\NoC_2x2_Project`; it may resolve through a junction to the longer HDL & PLD folder. The installation is `E:\Vivado-ML\2026.1\Vivado\bin\vivado.bat`, and the existing GUI project is `E:\Vivado_Projects\NoC_2x2\NoC_2x2.xpr`. A clone can live elsewhere. This workflow requires no OS folder edits, relocation or security-policy changes.

Preserve baseline evidence by testing in another checkout. From a Git checkout:

```powershell
git clone . ..\NoC-Vivado-Verification
Set-Location ..\NoC-Vivado-Verification
$vivadoLauncher = 'E:\Vivado-ML\2026.1\Vivado\bin\vivado.bat'
.\scripts\run_vivado.ps1 -Task Create -ProjectDir 'E:\Vivado_Projects\NoC_Publication_Check' -VivadoCommand $vivadoLauncher
.\scripts\run_vivado.ps1 -Task Verify -ProjectDir 'E:\Vivado_Projects\NoC_Publication_Check' -VivadoCommand $vivadoLauncher
```

`Create` sets VHDL-2008, exact Spartan-7 part, XSim, sources and `DEPTH=4 SCENARIO=0 TRACE_LEVEL=2`. `Verify` runs fourteen configurations and checks saved PASS markers. Its Tcl uses actual `simulate.log` output rather than assuming an absent `xsim.log` filename.

Other supported tasks are `Simulate`, `Synthesize`, and `RouteDemo`:

```powershell
.\scripts\run_vivado.ps1 -Task Synthesize -VivadoCommand $vivadoLauncher
.\scripts\run_vivado.ps1 -Task RouteDemo -VivadoCommand $vivadoLauncher
```

Synthesize targets the exposed `noc_2x2_core`; RouteDemo targets `noc_fpga_demo_top`, then optimizes, places and routes OOC. Reports go under `evidence/vivado/synthesis_ooc` and `evidence/vivado/route_demo_ooc`. The route script writes `build/checkpoints/demo_ooc_routed.dcp`. They overwrite output paths in the verification checkout, not the immutable baseline ZIP. No step assigns real board pins or generates/programs a board bitstream.

The wrapper's default `-ProjectDir` is the original E-drive project folder. Use an explicit separate folder when creating a new GUI project, as above. The project contains absolute source references after generation; a project created elsewhere can still point back to the original source if an existing XPR is reused. Prefer a new project directory for an independent checkout.

If PowerShell reports an unsigned downloaded script, inspect the script and its publication hash before addressing a file-specific download block under your institution's policy. Do not disable Smart App Control or change machine-wide execution policy as a repository setup step. Ask the lab administrator if enforced policy prevents execution.

To stop a dashboard terminal press Ctrl+C. To close Vivado, save source edits and desired wave configuration, then use File → Exit. Stopping an idle terminal does not delete saved source files. Preserve important simulation logs before rerunning a task that writes the same evidence paths.

SDF timing simulation is optional/deferred in this release. Do not reuse the behavioral array-port testbench blindly with a flattened netlist: fixed generics and port types can differ. The supplied diagnostic console is retained honestly; no shortcut that removes timing annotations is represented as a timing PASS.
