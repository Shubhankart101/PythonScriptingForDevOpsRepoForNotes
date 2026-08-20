param([Parameter(Mandatory)] [string]$ResourceGroupName, [switch]$WhatIf)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
if (-not (Get-Command az -ErrorAction SilentlyContinue)) { throw 'Azure CLI is required.' }
$args = @('group', 'show', '--name', $ResourceGroupName, '--output', 'json')
if ($WhatIf) { Write-Host "Would run: az $($args -join ' ')"; return }
az @args
if ($LASTEXITCODE -ne 0) { throw "Azure CLI failed with exit code $LASTEXITCODE" }
