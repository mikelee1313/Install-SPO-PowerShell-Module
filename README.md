**Summary**
It’s a good practice to ensure the latest version of the SharePoint Online Module is installed, because it’s constantly being updated with new and improved features.

I’m just sharing a quick PowerShell script that ensures the latest SharePoint online PowerShell module is installed.

There 2 different ways to install this module.

1. Download and install using Windows installer from https://go.microsoft.com/fwlink/p/?LinkId=255251
2. Install from the PowerShell Gallery “Install-Module -Name Microsoft.Online.SharePoint.PowerShell“

If you don’t know what version or which method was used to install the SharePoint Online PowerShell module, this script is for you.

**What does the script do?**
1. If the Windows installer version is installed, uninstall it.
2. If the PowerShell Gallery version is installed, uninstall it.
3. Install the latest version SharePoint Online Module from the PowerShell Gallery.

**More Information**
The following sites are a great starting point to learn more about the SharePoint Online PowerShell module.

Intro to SharePoint Online Management Shell | Microsoft Learn
https://learn.microsoft.com/en-us/powershell/sharepoint/sharepoint-online/introduction-sharepoint-online-management-shell?view=sharepoint-ps

Get started with the SharePoint Online Management Shell | Microsoft Learn
https://learn.microsoft.com/en-us/powershell/sharepoint/sharepoint-online/connect-sharepoint-online

Microsoft.Online.SharePoint.PowerShell Module | Microsoft Learn
https://learn.microsoft.com/en-us/powershell/module/sharepoint-online/?view=sharepoint-ps
