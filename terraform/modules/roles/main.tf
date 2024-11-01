resource "keycloak_role" "admin" {
  realm_id    = var.realm_id
  name        = "admin"
  description = "Administrator role"
}

resource "keycloak_role" "user" {
  realm_id    = var.realm_id
  name        = "user"
  description = "Regular user role"
}