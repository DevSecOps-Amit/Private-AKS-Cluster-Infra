resource "azurerm_log_analytics_workspace" "aks-log" {
  name                = "aks-log-analysis"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

