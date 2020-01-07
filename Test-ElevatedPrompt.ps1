<# IMPORTANT NOTE HOW TO USE THE BELOW FUNCTION OR CODE

DOT source this script to use the Test-IsAdmin function (or create your .psm1 module with this function inside)

OR

Remove the "Function Test-IsAdmin {}" statements and just include the Try {} Catch{} lines

#>

Function Test-IsAdmin {
    try {
        $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
        $principal = New-Object Security.Principal.WindowsPrincipal -ArgumentList $identity
        return $principal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator )
    } catch {
        throw "Failed to determine if the current user has elevated privileges. The error was: '{0}'." -f $_
    }

    <#
        .SYNOPSIS
            Checks if the current Powershell instance is running with elevated privileges or not.
        .EXAMPLE
            PS C:\> Test-IsAdmin
        .OUTPUTS
            System.Boolean
                True if the current Powershell is elevated, false if not.
         .LINK
            Credits : https://github.com/aarismendi/ps-scripts/blob/master/Modules/Security/Security.psm1
    #>
}
