STORAGE=metricsstorage$RANDOM

az storage account create \
    --name $STORAGE \
    --sku Standard_LRS \
    --location eastus2 \
    --resource-group learn-a46e2518-68e5-4cf2-8553-5e49d4f860a8

ssh-keygen -m PEM -t rsa -b 4096
id_rsa id_rsa.pub
az vm create \
    --name monitored-linux-vm \
    --image UbuntuLTS \
    --size Standard_B1s \
    --location eastus2 \
    --admin-username azureuser \
    --boot-diagnostics-storage $STORAGE \
    --resource-group learn-a46e2518-68e5-4cf2-8553-5e49d4f860a8
