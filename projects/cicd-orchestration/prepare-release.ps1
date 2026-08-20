param([ValidateSet('dev','test','prod')] [string]$Environment = 'dev', [string]$Version = '0.1.0')

$release = [ordered]@{ environment = $Environment; version = $Version; commit = $env:GITHUB_SHA; generatedAt = (Get-Date).ToUniversalTime().ToString('o') }
$release | ConvertTo-Json | Set-Content release.json -Encoding utf8
Write-Output ($release | ConvertTo-Json -Compress)
