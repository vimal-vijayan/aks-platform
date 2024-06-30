terraform {
  cloud {
    organization = "optimus"
    hostname = "app.terraform.io"

    workspaces {
      project = "AKS"
      name = "aks-dev"
    }
  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.110.0"
    }
  }
}


# Define the Azure provider
provider "azurerm" {
    features {}
}