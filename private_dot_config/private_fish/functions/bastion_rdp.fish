function bastion_rdp
az network bastion tunnel --name bastion-workstations-de-devops -g rg-network-de-devops --target-resource-id /subscriptions/3d2e67f3-db76-4e6b-ba42-c9e95ced3932/resourceGroups/RG-JAN-WORKSTATION-DE-DEVOPS/providers/Microsoft.Compute/virtualMachines/vm-workstation-jan-de-devops --resource-port=3389 --port=3389
end
