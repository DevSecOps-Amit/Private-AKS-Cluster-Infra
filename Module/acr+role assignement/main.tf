        resource "random_string" "rand" {
        length  = 4
        special = false
        upper   = false
        }

        resource "azurerm_container_registry" "acr" {
        name                = "prodacr${random_string.rand.result}"
        resource_group_name = var.rg_name
        location            = var.location
        sku                 = "Premium"
        admin_enabled       = false
        }

        # resource "azurerm_role_assignment" "acr_pull" {
        # principal_id       = var.aks_principal_id
        # role_definition_name = "AcrPull"
        # scope              = azurerm_container_registry.acr.id
        # }

       resource "azurerm_role_assignment" "acr_pull" {
        principal_id         = var.aks_principal_id
        role_definition_name = "AcrPull"
        scope                = azurerm_container_registry.acr.id
     }