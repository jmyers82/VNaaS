terraform {
  cloud {
    organization = "hashiconf24"
    hostname     = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      name = "hvn-vault-setup"
    }
  }
}