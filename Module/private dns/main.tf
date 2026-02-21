
resource "azurerm_private_dns_zone" "aks" {
name = "privatelink.${var.location}.azmk8s.io"
resource_group_name = var.rg_name
}


resource "azurerm_private_dns_zone_virtual_network_link" "link" {
name = "aks-dns-link"
private_dns_zone_name = azurerm_private_dns_zone.aks.name
resource_group_name = var.rg_name
virtual_network_id = var.vnet_id
}