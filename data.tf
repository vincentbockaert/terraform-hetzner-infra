data "hcloud_image" "debian_lts" {
  name              = "debian-12"
  with_architecture = "x86"
  most_recent       = true
}

data "github_user" "current" {
  username = "" # Use an empty string "" to retrieve information about the currently authenticated user.
}

data "cloudflare_ip_ranges" "cloudflare" {}
