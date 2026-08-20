function Invoke-WithRetry {
    [CmdletBinding()]
    param([Parameter(Mandatory)] [scriptblock]$Operation, [int]$MaxAttempts = 4, [int]$DelaySeconds = 2)

    for ($attempt = 1; $attempt -le $MaxAttempts; $attempt++) {
        try { return & $Operation }
        catch {
            if ($attempt -eq $MaxAttempts) { throw }
            Start-Sleep -Seconds ($DelaySeconds * [math]::Pow(2, $attempt - 1))
        }
    }
}

Export-ModuleMember -Function Invoke-WithRetry
