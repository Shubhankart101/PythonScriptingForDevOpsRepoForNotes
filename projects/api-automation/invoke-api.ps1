param([Parameter(Mandatory)] [string]$Uri, [hashtable]$Headers = @{})

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$response = Invoke-RestMethod -Uri $Uri -Headers $Headers -Method Get
$response | ConvertTo-Json -Depth 10
