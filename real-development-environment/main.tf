# Uncomment to run 
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Acd zure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
#What it is               Alias
resource "azurerm_resource_group" "example" {
  name     = "rg-development-area-terraform"
  location = "usgovvirginia"
  tags = {
    environment = "dev"
    lifespan    = "disposable"
  }
}

# Create a virtual network within the resource group
#What it is               Alias
resource "azurerm_virtual_network" "example-network" {
  name                = "rg-development-area-terraform-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["170.126.0.0/16"]
  tags = {
    environment = "dev"
    lifespan    = "disposable"
  }
}

resource "azurerm_subnet" "example-subnet" {
  name                 = "rg-development-area-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example-network.name
  address_prefixes     = ["170.126.1.0/24"]
}

resource "azurerm_network_security_group" "junk-sg" {
  name                = "terraform-development-area-sg"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    environment = "dev"
    lifespan    = "disposable"
  }
}

resource "azurerm_network_security_rule" "junk-rule" {
  name                        = "dev-development-area-rule"
  priority                    = 100
  direction                   = "Inbound" # allow access 
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.junk-sg.name
}


resource "azurerm_subnet_network_security_group_association" "junk-association" {
  subnet_id                 = azurerm_subnet.example-subnet.id
  network_security_group_id = azurerm_network_security_group.junk-sg.id
}


resource "azurerm_public_ip" "junk-public-ip" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Dynamic" # No ip will exist until other resources are provisioned

  tags = {
    environment = "Dev"
  }
}


resource "azurerm_network_interface" "example" {
  name                = "development-area-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.junk-public-ip.id
  }
  tags = {
    environment = "Dev"
    lifespan    = "Disposable"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "alvarez-development-machine"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_D2s_v3"
  admin_username      = "jalvarez"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]



  custom_data = filebase64("customdata.tpl")

  admin_ssh_key {
    username   = "jalvarez"
    public_key = file("~/.ssh/jalvarez.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  # Never got this to work
  # provisioner "local-exec" {
  #   command = templatefile( "windows-ssh-script.tpl", {
  #     hostname = self.public_ip_address,
  #     user = "adminuser",
  #     pem = "~/.ssh/azurekey"
  #   })
  #   interpreter = ["Powershell", "-command"]
  # }

  tags = {
    environment = "dev"
    lifespan    = "disposable"
  }
}

data "azurerm_public_ip" "junk_public_ip_data" {
  name                = azurerm_public_ip.junk-public-ip.name
  resource_group_name = azurerm_resource_group.example.name
}

output "public-ip-address" {
  value = "${azurerm_linux_virtual_machine.example.name}: ${data.azurerm_public_ip.junk_public_ip_data.ip_address} "
}