resource "azurerm_resource_group" "resource_group_name" {
  name     = "rg-${local.app_name}-aks-${local.workspace_spec.env}"
  location = "West Europe"
  tags = {
    owner = "vimal"
  }
}

# resource "azurerm_kubernetes_cluster" "example" {
#   name                = "example-aks1"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   dns_prefix          = "exampleaks1"

#   default_node_pool {
#     name       = "default"
#     node_count = 1
#     vm_size    = "Standard_D2_v2"
#   }

#   identity {
#     type = "SystemAssigned"
#   }

#   tags = {
#     Environment = "Production"
#   }
# }

# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.example.kube_config[0].client_certificate
#   sensitive = true
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.example.kube_config_raw

#   sensitive = true
# }
