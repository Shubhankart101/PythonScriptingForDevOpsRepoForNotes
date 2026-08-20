param([Parameter(Mandatory)] [string]$Uri, [int]$MaxAttempts = 3)

for ($attempt = 1; $attempt -le $MaxAttempts; $attempt++) {
    try { Invoke-RestMethod -Uri $Uri -Method Get; break }
    catch {
        if ($attempt -eq $MaxAttempts) { throw }
        Start-Sleep -Seconds ([math]::Pow(2, $attempt))
    }
}
