terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.base_name
  location = var.location
  tags     = var.tags
}

output "resource_group_name" {
  # value = var.base_name
  value = azurerm_resource_group.resource_group.name
}