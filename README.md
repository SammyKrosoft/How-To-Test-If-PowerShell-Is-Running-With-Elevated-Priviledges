# Test-AdminRights
Function to test if user running PoSH with Admin rights

# Or use a one-liner
## One-liner variant #1
- using [Security.Principal.WindowsBuiltInRole]::Administrator
```powershell
([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
```
## One-liner variant #2
- using [Security.Principal.WindowsBuiltInRole] "Administrator"
```powershell
([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
```

## One-liner variant #3
- using New-Object Security.Principal.WindowsPrincipal instead of [Security.Principal.WindowsPrincipal] constructor
```powershell
(New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
```



# And using an IF statement

```powershell
if ((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
  Write-Output "Elevated."
}
else
{
  Write-Output "Not elevated."
}
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
