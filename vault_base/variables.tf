variable "hvn_client_id" {
  type        = string
  description = "hvn client id for hashiconf24"
}

variable "hvn_client_secret" {
  type        = string
  description = "hvn client secret for hashiconf24"
  sensitive   = true
}