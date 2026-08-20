param([string]$LogPath = '.\automation.log')

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

"[$(Get-Date -Format o)] automation started" | Add-Content $LogPath
Get-ChildItem -File | Select-Object Name, Length, LastWriteTime
"[$(Get-Date -Format o)] automation completed" | Add-Content $LogPath
