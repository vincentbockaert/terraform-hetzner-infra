# cloudflare

output "cloudflare_ip_ranges" {
  value = data.cloudflare_ip_ranges.cloudflare.cidr_blocks
}

# hetzner cloud

output "hetzner_primary_selfhost_reachability" {
  value = "Servername: ${hcloud_server.primary_selfhost.name}\nIPV4: ${hcloud_server.primary_selfhost.ipv4_address}\nIPV6: ${hcloud_server.primary_selfhost.ipv6_address}"
}

