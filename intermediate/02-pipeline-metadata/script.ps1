param([string]$Environment = 'dev', [string]$Version = '1.0.0')

$metadata = [ordered]@{ environment = $Environment; version = $Version; commit = $env:GITHUB_SHA; generatedAt = (Get-Date).ToUniversalTime().ToString('o') }
$metadata | ConvertTo-Json | Set-Content pipeline-metadata.json -Encoding utf8
Write-Output ($metadata | ConvertTo-Json -Compress)
