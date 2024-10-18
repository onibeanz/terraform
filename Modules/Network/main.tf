provider "azurerm" {
  features {  }
  subscription_id = "7c064ed9-c59f-4935-938b-f1a654d088a7"

}

resource "azurerm_public_ip" "ip" {
  name                = "lbip-${var.base-name}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.base-name}"
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

resource "azurerm_lb" "loadbalancer" {
  name                = "lb-${var.base-name}"
  location            = var.location
  resource_group_name = var.rg-name

  frontend_ip_configuration {
    name                 = azurerm_public_ip.ip.name
    public_ip_address_id = azurerm_public_ip.ip.id
  }
}