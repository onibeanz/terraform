provider "azurerm" {
  features {  }
  subscription_id = "7c064ed9-c59f-4935-938b-f1a654d088a7"

}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.base-name}-01"
  location            = var.location
  resource_group_name = var.rg-name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name = "subnet-${var.base-name}-01"
  resource_group_name = var.rg-name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_lb" "example" {
  name                = "TestLoadBalancer"
  location            = var.location
  resource_group_name = var.rg-name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    private_ip_address = "10.0.0.69"
  }
}