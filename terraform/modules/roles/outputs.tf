output "admin_role_id" {
  value = keycloak_role.admin.id
}

output "user_role_id" {
  value = keycloak_role.user.id
}