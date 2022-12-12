$location = (Get-AzResourceGroup -Name az104-03b-rg1).Location

$rgName = 'az104-03c-rg1'

New-AzResourceGroup -Name $rgName -Location $location

Get-AzResourceGroup -Name $rgName

$diskConfig = New-AzDiskConfig `
 -Location $location `
 -CreateOption Empty `
 -DiskSizeGB 32 `
 -Sku Standard_LRS

$diskName = 'az104-03c-disk1'

New-AzDisk `
 -ResourceGroupName $rgName `
 -DiskName $diskName `
 -Disk $diskConfig

 Get-AzDisk -ResourceGroupName $rgName -Name $diskName

 New-AzDiskUpdateConfig -DiskSizeGB 64 | Update-AzDisk -ResourceGroupName $rgName -DiskName $diskName

 Get-AzDisk -ResourceGroupName $rgName -Name $diskName

 (Get-AzDisk -ResourceGroupName $rgName -Name $diskName).Sku

 New-AzDiskUpdateConfig -Sku Premium_LRS | Update-AzDisk -ResourceGroupName $rgName -DiskName $diskName

 (Get-AzDisk -ResourceGroupName $rgName -Name $diskName).Sku