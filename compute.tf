resource "hcloud_server" "primary_selfhost" {
  name        = "primary-selfhost"
  image       = data.hcloud_image.debian_lts.name
  location    = "nbg1"
  server_type = "cpx11"
  firewall_ids = [
    hcloud_firewall.default_firewall.id
  ]

  ssh_keys = [for k in hcloud_ssh_key.ssh_key : k.id]

  public_net {
    ipv4_enabled = false
    ipv6_enabled = true
  }
}

resource "hcloud_ssh_key" "ssh_key" {
  count = length(data.github_user.current.ssh_keys)
  public_key = data.github_user.current.ssh_keys[count.index]
  name       = "GitHub SSH Key - ${count.index}"
}

resource "hcloud_firewall" "default_firewall" {
  name = "default_firewall"
  rule {
    direction = "in"
    protocol  = "icmp"
    source_ips = [
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
      "::/0"
    ]
  }
}