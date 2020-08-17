#Setting context
Get-AzRecoveryServicesVault -Name "VaultName" | Set-AzRecoveryServicesVaultContext

# Fetching DBs enabled for SQL backup & Filtering it with SQL Server name
$bkpItem = Get-AzRecoveryServicesBackupItem -BackupManagementType AzureWorkload -WorkloadType MSSQL | Where-Object { $_.ServerName -eq "ServerName"}

#fetching target Policy and storing it in Pol variable.
$Pol = Get-AzRecoveryServicesBackupProtectionPolicy -Name "NewPolicy"   

#You can use for loop and form sets of DBs which would go in one Protection policy, my example shows changing it for the Bkpitem at 13th Index
Enable-AzRecoveryServicesBackupProtection -Item $bkpItem[13] -Policy $Pol

<#foreach ($i in $Item)
{
Enable-AzRecoveryServicesBackupProtection -Item $bkpItem[$i] -Policy $Pol
} #>
