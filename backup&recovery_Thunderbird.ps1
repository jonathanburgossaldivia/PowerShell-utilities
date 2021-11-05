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