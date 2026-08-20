param([string]$BaselinePath = '.\baseline.json')

Set-StrictMode -Version Latest
$baseline = if (Test-Path $BaselinePath) { Get-Content $BaselinePath -Raw | ConvertFrom-Json } else { [pscustomobject]@{ requiredPowerShellMajor = 7 } }
$current = $PSVersionTable.PSVersion.Major
[pscustomobject]@{ check = 'PowerShell version'; expected = $baseline.requiredPowerShellMajor; actual = $current; compliant = $current -ge $baseline.requiredPowerShellMajor } | ConvertTo-Json
