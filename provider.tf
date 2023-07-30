terraform {

  cloud {
    organization = "vb-devops-playground"
    workspaces {
      name = "behold-my-stuff-infra"
    }
  }

  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.38.2"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "4.3.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "cloudflare" {
  # env: CLOUDFLARE_API_TOKEN 
}

provider "hcloud" {
  # env: HCLOUD_TOKEN
}

provider "github" {
  # env: GITHUB_TOKEN
}