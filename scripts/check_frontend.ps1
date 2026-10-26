$ErrorActionPreference='Stop'
$projectRoot=Split-Path -Parent $PSScriptRoot
Push-Location (Join-Path $projectRoot 'frontend')
try {
 foreach($npmTask in @('ci','test','run build')) {
  if($npmTask -eq 'ci') {npm ci}
  elseif($npmTask -eq 'test') {npm test}
  else {npm run build}
  if($LASTEXITCODE -ne 0) {throw "Frontend step failed: $npmTask"}
 }
} finally {Pop-Location}
