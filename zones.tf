# get zone id's
# NOTE: zone name's can be the same across accounts thus you should use the account_id when data-calling them

data "cloudflare_zone" "techheresy_com_zone" {
  account_id = var.cf_account_id
  name       = "techheresy.com"
}

data "cloudflare_zone" "vincentbockaert_xyz_zone" {
  account_id = var.cf_account_id
  name       = "vincentbockaert.xyz"
}

# if you modified any of these settings manually before ... :( you might have a tainted resource, 
# resolved after "running apply once (fails), state rm the settings & apply again"
resource "cloudflare_zone_settings_override" "techheresy_com_zone-settings" {
  zone_id = data.cloudflare_zone.techheresy_com_zone.zone_id

  # do not try manage / override every setting --> only those settings that you want to change from the default
  settings {
    tls_1_3                  = "on"
    automatic_https_rewrites = "on"
    ssl                      = "strict"
  }
}

# if you modified any of these settings manually before ... :( you will have a tainted resource, 
# resolved after "running apply once (fails), state rm the settings & apply again"
resource "cloudflare_zone_settings_override" "vincentbockaert_xyz_zone-settings" {
  zone_id = data.cloudflare_zone.vincentbockaert_xyz_zone.zone_id

  # do not try manage / override every setting --> only those settings that you want to change from the default
  settings {
    tls_1_3                  = "on"
    automatic_https_rewrites = "on"
    ssl                      = "strict"
  }
}

resource "cloudflare_origin_ca_certificate" "techheresy" {
  csr                = file("csr.pem")
  hostnames          = var.origin_ca_hostnames
  request_type       = "origin-rsa"
  requested_validity = 1095
}