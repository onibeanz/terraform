terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-sim-back"
    storage_account_name = "sasim0ai1uobicgback"
    container_name       = "tfstate"
    key                  = "backend.terraform.tfstate"
}
}

provider "azurerm" {
  features {}
}