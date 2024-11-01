variable "realm_name" {
  type    = string
  default = "ecommerce"
}

variable "display_name" {
  type    = string
  default = "E-Commerce Platform"
}

variable "access_token_lifespan" {
  type    = string
  default = "15m"
}

variable "refresh_token_lifespan" {
  type    = string
  default = "30d"
}

variable "password_policy" {
  type    = string
  default = "upperCase(1) and length(8) and forceExpiredPasswordChange(365) and notUsername"
}

variable "supported_locales" {
  type    = list(string)
  default = ["en", "pt-BR"]
}

variable "default_locale" {
  type    = string
  default = "en"
}