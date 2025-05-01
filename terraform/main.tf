terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.27.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "rg-sp-common"
      storage_account_name = "stspcommon"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
      use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "state-demo"
  location = "eastus"
}