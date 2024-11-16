terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

resource "random_string" "random_string" {
  length  = 10
  special = false
  upper   = false
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.base_name}${random_string.random_string.result}"
  resource_group_name      = var.rgname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags

  static_website {
    index_document = var.index_document
  }
}

resource "azurerm_storage_blob" "index_html" {
  name = var.index_document
  storage_account_name = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type = "Block"
  content_type = "text/html"
  source_content = var.source_content
}

output "storage_account_name" {
  value = azurerm_storage_account.storage_account.primary_access_key
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.storage_account.primary_web_endpoint
}