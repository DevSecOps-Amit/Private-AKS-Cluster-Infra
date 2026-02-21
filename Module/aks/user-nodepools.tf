resource "azurerm_kubernetes_cluster_node_pool" "user" {
  for_each = var.user_node_pools

  name                   = each.value.name
  kubernetes_cluster_id  = azurerm_kubernetes_cluster.aks.id
  vm_size                = each.value.vm_size
  auto_scaling_enabled   = each.value.auto_scaling
  min_count              = each.value.min_count
  max_count              = each.value.max_count
  node_count             = each.value.node_count
  mode                   = "User"
  vnet_subnet_id         = var.subnet_id

}
