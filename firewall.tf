resource "hcloud_firewall" "default_firewall" {
  name = "default_firewall"
  rule {
    direction = "in"
    protocol  = "icmp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "80"
    source_ips = data.cloudflare_ip_ranges.cloudflare.cidr_blocks
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "443"
    source_ips = data.cloudflare_ip_ranges.cloudflare.cidr_blocks
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  // minecraft
  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "25565"
    source_ips = var.minecraft_whitelist_cidrs
  }
}

data "cloudflare_ip_ranges" "cloudflare" {}

