function Get-DeploymentEnvironment {
    [CmdletBinding()]
    param([ValidateSet('dev','test','prod')] [string]$Environment)

    [pscustomobject]@{ Name = $Environment; IsProduction = $Environment -eq 'prod' }
}

try { Get-DeploymentEnvironment -Environment 'dev' }
catch { Write-Error $_; throw }
