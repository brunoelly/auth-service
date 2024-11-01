output "client_id" {
  value = keycloak_openid_client.client.client_id
}

output "client_secret" {
  value     = keycloak_openid_client.client.client_secret
  sensitive = true
}