$deployment = [pscustomobject]@{
    application = 'api'
    environment = 'dev'
    version     = '1.0.0'
}

$deployment | ConvertTo-Json | Set-Content deployment.json -Encoding utf8
Get-Content deployment.json -Raw | ConvertFrom-Json
