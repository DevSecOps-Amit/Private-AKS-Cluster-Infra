

resource "azurerm_virtual_network" "vnet" {
name = "aks-vnet"
address_space = [var.vnet_cidr]
location = var.location
resource_group_name = var.rg_name
}


resource "azurerm_subnet" "aks" {
name = "aks-subnet"
resource_group_name = var.rg_name
virtual_network_name = azurerm_virtual_network.vnet.name
address_prefixes = [var.aks_subnet_cidr]
}