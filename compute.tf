resource "hcloud_server" "hetzner_fedora" {
  name        = "hetzner-fedora"
  image       = data.hcloud_image.fedora_image.name
  location = "nbg1"
  server_type = "cx21"
  firewall_ids = [
    hcloud_firewall.default_firewall.id
  ]

  ssh_keys = [for k in hcloud_ssh_key.ssh_key: k.id]

  public_net {
    ipv4_enabled = false
    ipv6_enabled = true
  }
}

resource "random_pet" "pet" {
  for_each = toset(data.github_user.current.ssh_keys)
}

resource "hcloud_ssh_key" "ssh_key" {
  for_each = toset(data.github_user.current.ssh_keys)
  public_key = each.key
  name = "GitHub SSH Key - ${random_pet.pet[each.key].id}"
}

data "hcloud_image" "fedora_image" {
  name              = "fedora-37"
  with_architecture = "x86"
  most_recent       = true
}

data "github_user" "current" {
  username = "" # Use an empty string "" to retrieve information about the currently authenticated user.
}