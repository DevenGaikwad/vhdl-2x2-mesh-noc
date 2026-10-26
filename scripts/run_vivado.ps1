[CmdletBinding()]
param(
 [ValidateSet('Create','Simulate','Verify','Synthesize','RouteDemo')][string]$Task='Verify',
 [string]$ProjectDir='E:\Vivado_Projects\NoC_2x2',
 [string]$VivadoCommand='vivado'
)
$ErrorActionPreference='Stop'
$projectRoot=Split-Path -Parent $PSScriptRoot
$scriptName=@{Create='create_project.tcl';Simulate='run_sim.tcl';Verify='run_verification.tcl';Synthesize='run_synth.tcl';RouteDemo='run_route_demo.tcl'}[$Task]
$env:NOC_PROJECT_DIR=$ProjectDir
$logDir=Join-Path $projectRoot 'evidence\vivado'
$buildDir=Join-Path $projectRoot 'build\vivado'
New-Item -ItemType Directory -Force $logDir,$buildDir | Out-Null
$command=Get-Command $VivadoCommand -ErrorAction Stop
Push-Location $projectRoot
try {
 & $command.Source -mode batch -notrace -source (Join-Path $projectRoot "vivado\$scriptName") -log (Join-Path $logDir "$Task.log") -journal (Join-Path $buildDir "$Task.jou")
 if ($LASTEXITCODE -ne 0) {throw "Vivado $Task failed, exit $LASTEXITCODE. Preserve and inspect the log."}
 Write-Host "Command returned successfully. Read its actual assertions and reports; do not infer hardware success."
} finally {Pop-Location}
