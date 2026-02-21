output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "aks_uami_principal_id" {
  value = azurerm_user_assigned_identity.aks_uami.principal_id
}

output "aks_uami_id" {
  value = azurerm_user_assigned_identity.aks_uami.id
}

