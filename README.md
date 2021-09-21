## Powershell utilities for System Administrators or TI technical support

### How to use

These scripts are only for Windows 10 but if you use Linux and you want to modify them, the way to do it is by executing the command:

```{ bash}
pwsh
```

Once PowerShell is executed you must enable the execution of scripts for this you must write:

```{PowerShell}
Set-ExecutionPolicy Unrestricted
```

### How to run the scripts

Already with powershell running you must put the path of the script, for example:

```{PowerShell}
C:\TestPS.ps1
```

### The utilities

_1. Working with DSN ODBC_

Import DSN:

```{PowerShell}
$user_profile = [Environment]::GetFolderPath([Environment+SpecialFolder]::UserProfile)
$dsn_folder = $user_profile + "\Desktop\"
$dsn_file = $dsn_folder + "dsn.xml"

Import-Clixml $dsn_file |Add-OdbcDsn
```

Export DSN:

```{PowerShell}
$user_profile = [Environment]::GetFolderPath([Environment+SpecialFolder]::UserProfile)
$dsn_folder = $user_profile + "\Desktop\"
$dsn_file = $dsn_folder + "dsn.xml"

Get-OdbcDsn |Export-Clixml $dsn_file
```

_2. Enable Windows Optional Features_

Enable a feature such as NetFx3:

```{PowerShell}
Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3"
```

_3. Check Windows 10 version_

To know that just write:

```{PowerShell}
Get-ComputerInfo | Select-Object WindowsProductName
```

_4. Backup and recovery of entire Thunderbird client email accounts_

The script facilitates the copying of the data, creates a file with the extension PS1 and places code inside, with option 1 the script exports the data to the Desktop path, copies that folder to the Desktop path of the computer where you are going to import the data, before executing the script you must have Thunderbird installed, finally select option 2 to import.

```{PowerShell}
$user_profile = [Environment]::GetFolderPath([Environment+SpecialFolder]::UserProfile)
$app_data = [Environment]::GetFolderPath([Environment+SpecialFolder]::ApplicationData)
$thunderbird = $app_data + "\Thunderbird"
$to_desktop = $user_profile + "\Desktop\backup_Thunderbird"
$selection = Read-Host -Prompt "Enter 1 for export or 2 for Import"

If ($selection  -eq '1') {
    Write-Host "Export Thunderbird configuration folder to desktop"
    Copy-Item $thunderbird -Recurse -Destination $to_desktop
} ElseIf ($selection  -eq '2') {
    Write-Host "Import 'backup_Thunderbird' folder from desktop"
    Copy-Item $to_desktop -Recurse -Destination $thunderbird
} Else {
    Write-Host "Incorrect selection"
}
```
