

# Create a resource group
resource "azurerm_resource_group" "resource_group" {
    name     = "rg-${local.app_name}-aks-${local.workspace_spec.env}-infra"
    location = "westeurope"
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "vnet-${local.app_name}-aks-${local.workspace_spec.env}"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.resource_group.location
    resource_group_name = azurerm_resource_group.resource_group.name
}

# Create three subnets
resource "azurerm_subnet" "example" {
    count                 = 3
    name                  = "subnet-${count.index}"
    resource_group_name   = azurerm_resource_group.resource_group.name
    virtual_network_name  = azurerm_virtual_network.vnet.name
    address_prefixes      = ["10.0.${count.index}.0/24"]
}