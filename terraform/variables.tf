variable "keycloak_url" {
  type        = string
  description = "Keycloak server URL"
  default     = "http://keycloak:8080"
}

variable "keycloak_admin_username" {
  type        = string
  description = "Keycloak admin username"
  default     = "admin"
}

variable "keycloak_admin_password" {
  type        = string
  description = "Keycloak admin password"
  default     = "admin"
  sensitive   = true
}