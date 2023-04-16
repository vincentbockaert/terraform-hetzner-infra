# cloudflare

output "cloudflare_ip_ranges" {
  value = data.cloudflare_ip_ranges.cloudflare.cidr_blocks
}

output "origina_ca_cert" {
  value = cloudflare_origin_ca_certificate.techheresy.certificate
}

# hetzner cloud

output "hetzner_fedora_reachability" {
    value = "Servername: ${hcloud_server.hetzner_fedora.name}, IPV6: ${hcloud_server.hetzner_fedora.ipv6_address}"
}

