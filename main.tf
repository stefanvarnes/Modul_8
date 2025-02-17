terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
    backend "azurerm" {
        resource_group_name = "rg-tfdemo-modul6"
        storage_account_name = "satfbackendsvqwk0ualfog"
        container_name = "tfstate"
        key = "modul8.terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.ARM_SUBSCRIPTION_ID
  features {}

}

# Modules
module "ResourceGroup" {
  source    = "./ResourceGroup"
  base_name = local.rg_name
  location  = var.location
  tags      = local.tags
}

module "StorageAccount" {
  source    = "./StorageAccount"
  rgname    = module.ResourceGroup.resource_group_name
  base_name = var.saname
  location  = var.location
  tags      = local.tags
  scname = "tfstate"
  index_document = var.index_document
  source_content = "${var.source_content}: ${local.workspaces_suffix}"
}

output "pwe" {
  value = module.StorageAccount.primary_web_endpoint
}