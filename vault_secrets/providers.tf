terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.94.1"
    }
  }
}


provider "hcp" {
  client_id     = var.hvn_client_id
  client_secret = var.hvn_client_secret
}