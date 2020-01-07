# Test-AdminRights
Function to test if user running PoSH with Admin rights

# Or use a one-liner

```powershell
([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
```

# Or include the below Begin {} in your script/function

CREDITS: Daniel Engberg
https://danielengberg.com/check-if-powershell-script-is-running-as-administrator/
Thanks so much Daniel !

```powershell
Begin {
    #Checks if the user is in the administrator group. Warns and stops if the user is not.
    if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        Write-Warning "You are not running this as local administrator. Run it again in an elevated prompt." ; exit
    }
 ```
