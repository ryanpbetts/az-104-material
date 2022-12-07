winget install --id Microsoft.Powershell --source winget 

$PSVersionTable.PSVersion

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Install-Module -Name Az -AllowClobber -Scope CurrentUser

Connect-AzAccount

Get-AzSubscription

Set-AzContext -Subscription "sub id"