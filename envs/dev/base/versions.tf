terraform {
  cloud {
    organization = "oconnor17-demo"

    workspaces {
      name = "base-dev"
    }
  }

  required_providers {
  }
}

