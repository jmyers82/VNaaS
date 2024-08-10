resource "hcp_hvn" "hashiconf_hvn" {
  hvn_id         = "hashiconf24"
  cloud_provider = "azure"
  region         = "eastus"
  cidr_block     = "172.25.16.0/20"
}

## terraform import hcp_hvn.hashiconf_hvn hashiconf22hvn

resource "hcp_vault_cluster" "hashiconf24" {
  cluster_id      = "azure-vault-cluster"
  hvn_id          = hcp_hvn.hashiconf_hvn.hvn_id
  tier            = "starter_small"
  public_endpoint = true

  ip_allowlist {
    address     = "76.131.179.73/32"
    description = "my public IP"
  }
  lifecycle {
    prevent_destroy = true
  }
}