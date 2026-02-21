resource "azurerm_user_assigned_identity" "aks_uami" {
  name                = "aks-uami"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_role_assignment" "dns_contributor" {
  scope                = var.private_dns_zone_id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_uami.principal_id
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.aks_name
  kubernetes_version  = var.kubernetes_version

  private_cluster_enabled = true
  private_dns_zone_id     =  var.private_dns_zone_id


identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks_uami.id]
  }

role_based_access_control_enabled = true


default_node_pool {
name = var.system_node_pool.name
vm_size = var.system_node_pool.vm_size
node_count = var.system_node_pool.node_count
vnet_subnet_id = var.subnet_id
}

network_profile {
network_plugin = "azure"
network_policy = "calico"
}


oms_agent {
log_analytics_workspace_id = var.log_analytics_id
}
}