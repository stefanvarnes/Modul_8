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

resource "github_actions_secret" "subid_secret" {
  repository       = "MOdul_8"
  secret_name      = "ARM_SUBSCRIPTION_ID"
}

provider "azurerm" {
  # subscription_id = var.ARM_SUBSCRIPTION_ID
  subscription_id = github_actions_secret.subid_secret
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

#Test