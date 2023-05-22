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


