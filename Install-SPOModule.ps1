<#
.SYNOPSIS
This script uninstalls the "Microsoft.Online.SharePoint.PowerShell" module from Windows and PowerShell. 
If the module was installed using PowerShell or MSI, it will be uninstalled and then reinstalled using PowerShell.

.DESCRIPTION
The script checks if the "Microsoft.Online.SharePoint.PowerShell" module is installed using either PowerShell or MSI. 
If the module is found, it is uninstalled and then reinstalled using PowerShell. If the module is not found, it is installed using PowerShell.

.PARAMETER None
This script does not accept any parameters.

.EXAMPLE
.\install-spomodule.ps1
Runs the script to uninstall and reinstall the "Microsoft.Online.SharePoint.PowerShell" module.

.NOTES
This script requires administrative privileges to uninstall and install modules.
#>


# Uninstall SPO if installed from Windows then install with PowerShell
$spomod = Get-Module -Name Microsoft.Online.SharePoint.PowerShell -ListAvailable | Select-Object Name, Version
$spoapp = Get-WmiObject -Class Win32_Product | where-Object { $_.name -like "SharePoint Online Management Shell" }

try {
    if ($spomod -or $spoapp) {
        if ($spomod) {
            # Uninstall Operation
            Get-Module -Name 'Microsoft.Online.SharePoint.PowerShell' -ListAvailable | Select-Object Name, Version | Uninstall-Module -Force -AllVersions
        }

        if ($spoapp) {
            # Uninstall Operation
            $spoapp.Uninstall()
        }

        # Install SPO PowerShell
        Install-Module -Name 'Microsoft.Online.SharePoint.PowerShell' -Force -SkipPublisherCheck
        Write-Host "Close and reopen PowerShell, so the changes take effect" -ForegroundColor Green
      
    }
    else {
        # If the SPO Module is not installed by MSI or PowerShell, install it with PowerShell
        Install-Module -Name 'Microsoft.Online.SharePoint.PowerShell' -Force -SkipPublisherCheck
        Write-Host "Close and reopen PowerShell, so the changes take effect" -ForegroundColor Green
    }
}
catch {
    Write-Host "An error occurred: $_" -ForegroundColor Red
    Write-Host "Please ensure that the module is not in use and try again." -ForegroundColor Yellow
}

Write-Host "The New SPO Module version is:" -ForegroundColor Green
Get-Module -Name 'Microsoft.Online.SharePoint.PowerShell' -ListAvailable | Select-Object Name, Version
