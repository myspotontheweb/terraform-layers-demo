terraform {
  cloud {
    organization = "oconnor17-demo"

    workspaces {
      name = "base-dev"
    }
  }

  required_providers {
    tfe = {
      version = "~> 0.37.0"
    }
    random = {
      version = "~> 3.4.3"
    }
  }
}

