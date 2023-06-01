terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
#What it is               Alias
resource "azurerm_resource_group" "example" {
  name     = "rg-junk-terraform"
  location = "usgovvirginia"
  tags = {
    environment = "dev"
    lifespan    = "disposable"
  }
}

# Create a virtual network within the resource group
#What it is               Alias
resource "azurerm_virtual_network" "example-network" {
  name                = "rg-junk-terraform-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["170.123.0.0/16"]
  tags = {
    environment = "dev"
    lifespan    = "disposable"
  }
}

resource "azurerm_subnet" "example-subnet" {
    name = "rg-junk-subnet"
    resource_group_name = azurerm_resource_group.example.name
    virtual_network_name = azurerm_virtual_network.example-network.name
    address_prefixes = ["170.123.1.0/24"]
}

resource "azurerm_network_security_group" "junk-sg" {
  name                = "terraform-junk-sg"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    environment = "dev"
    lifespan = "disposable"
  }
}