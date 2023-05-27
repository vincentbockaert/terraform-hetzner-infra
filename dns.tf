# techheresy.com records

resource "cloudflare_record" "root_techheresy_com" {
  zone_id = data.cloudflare_zone.techheresy_com_zone.id
  name    = "@"
  value   = hcloud_server.primary_selfhost.ipv6_address
  type    = "AAAA"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "wildcard_techheresy_com" {
  zone_id = data.cloudflare_zone.techheresy_com_zone.id
  name    = "*"
  value   = hcloud_server.primary_selfhost.ipv6_address
  type    = "AAAA"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "mc_techheresy_com" {
  zone_id = data.cloudflare_zone.techheresy_com_zone.id
  name    = "mc"
  value   = hcloud_server.primary_selfhost.ipv4_address
  type    = "A"
  ttl     = 1
  proxied = false
}


# vincentbockaert.xyz records

resource "cloudflare_record" "root_vincentbockaert_xyz" {
  zone_id = data.cloudflare_zone.vincentbockaert_xyz_zone.id
  name    = "@"
  value   = hcloud_server.primary_selfhost.ipv6_address
  type    = "AAAA"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "wildcard_vincentbockaert_xyz" {
  zone_id = data.cloudflare_zone.vincentbockaert_xyz_zone.id
  name    = "*"
  value   = hcloud_server.primary_selfhost.ipv6_address
  type    = "AAAA"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "mc_vincentbockaert_xyz" {
  zone_id = data.cloudflare_zone.vincentbockaert_xyz_zone.id
  name    = "mc"
  value   = hcloud_server.primary_selfhost.ipv4_address
  type    = "A"
  ttl     = 1
  proxied = false
}

