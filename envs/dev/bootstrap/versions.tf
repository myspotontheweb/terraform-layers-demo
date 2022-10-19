terraform {
  cloud {
    organization = "myspotontheweb"

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

