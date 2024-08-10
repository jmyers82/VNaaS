# Enable jwt backend
resource "vault_jwt_auth_backend" "jwt_backend" {
  description        = "Demonstration of the Terraform JWT auth backend"
  path               = "jwt"
  oidc_discovery_url = "https://app.terraform.io"
  bound_issuer       = "https://app.terraform.io"
}

resource "vault_policy" "jwt_policy" {
  name = "tfc-policy"

  policy = file("${path.module}/policies/tfc-policy.hcl")
}

resource "vault_jwt_auth_backend_role" "example" {
  backend        = vault_jwt_auth_backend.jwt_backend.path
  role_name      = "tfc-role"
  token_policies = ["tfc-policy"]

  bound_audiences   = ["vault.workload.identity"]
  bound_claims_type = "glob"
  bound_claims = {
    sub = "organization:hashiconf24:project:default project:workspace:vault-base:run_phase:*"
  }
  user_claim    = "terraform_full_workspace"
  role_type     = "jwt"
  token_max_ttl = "20m"
}