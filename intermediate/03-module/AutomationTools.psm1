function Write-JsonLog {
    [CmdletBinding()]
    param([Parameter(Mandatory)] [string]$Message, [string]$Level = 'Info')

    [pscustomobject]@{ timestamp = (Get-Date).ToUniversalTime().ToString('o'); level = $Level; message = $Message } | ConvertTo-Json -Compress
}

Export-ModuleMember -Function Write-JsonLog
