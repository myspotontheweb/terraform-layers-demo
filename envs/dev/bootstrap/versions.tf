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
    multispace = {
      source = "mitchellh/multispace"
      version = "0.1.1"
    }
  }

  required_version  = "1.3.3"
}

