# Enable jwt backend
resource "vault_jwt_auth_backend" "jwt_backend" {
    description         = "Demonstration of the Terraform JWT auth backend"
    path                = "jwt"
    oidc_discovery_url  = "https://app.terraform.io"
    bound_issuer        = "https://app.terraform.io"
}

resource "vault_policy" "jwt_policy" {
  name = "platform-team"

  policy = file("${path.module}/policies/tfc-policy.hcl")
}