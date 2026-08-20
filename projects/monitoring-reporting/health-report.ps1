$report = [ordered]@{
    generatedAt = (Get-Date).ToUniversalTime().ToString('o')
    host = $env:COMPUTERNAME
    powershell = $PSVersionTable.PSVersion.ToString()
    processes = @(Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, Id, CPU)
}

$report | ConvertTo-Json -Depth 5 | Set-Content health-report.json -Encoding utf8
