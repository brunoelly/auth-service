variable "realm_id" {
  type = string
}

variable "client_id" {
  type    = string
  default = "auth-service"
}

variable "client_name" {
  type    = string
  default = "Auth Service"
}

variable "valid_redirect_uris" {
  type    = list(string)
  default = ["http://localhost:8080/*"]
}

variable "web_origins" {
  type    = list(string)
  default = ["+"]
}