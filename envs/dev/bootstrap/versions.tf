terraform {
  cloud {
    organization = "oconnor17-demo"

    workspaces {
      name = "bootstrap-dev"
    }
  }

  required_providers {
    tfe = {
      version = "~> 0.37.0"
    }
  }
}

