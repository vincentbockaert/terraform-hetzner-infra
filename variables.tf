variable "origin_ca_hostnames" {
  type = list(string)
}

variable "cf_account_id" {
  type      = string
  sensitive = true
}

variable "minecraft_whitelist_cidrs" {
  type = list(string)
}
