terraform {

  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "~> 0.37.0"
    }
    multispace = {
      source = "mitchellh/multispace"
      version = "0.1.1"
    }
  }
}

