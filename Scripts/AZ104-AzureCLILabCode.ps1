﻿LOCATION=$(az group show --name 'az104-03c-rg1' --query location --out tsv)

RGNAME='az104-03d-rg1'

az group create --name $RGNAME --location $LOCATION

az group show --name $RGNAME

DISKNAME='az104-03d-disk1'

az disk create \
--resource-group $RGNAME \
--name $DISKNAME \
--sku 'Standard_LRS' \
--size-gb 32

az disk show --resource-group $RGNAME --name $DISKNAME

az disk update --resource-group $RGNAME --name $DISKNAME --size-gb 64

az disk show --resource-group $RGNAME --name $DISKNAME --query diskSizeGb

az disk update --resource-group $RGNAME --name $DISKNAME --sku 'Premium_LRS'

az disk show --resource-group $RGNAME --name $DISKNAME --query sku

az group list --query "[?starts_with(name,'az104-03')].name" --output tsv

az group list --query "[?starts_with(name,'az104-03')].[name]" --output tsv | xargs -L1 bash -c 'az group delete --name $0 --no-wait --yes'