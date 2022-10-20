terraform {

  cloud {
    organization = "oconnor17-demo"

    workspaces {
      name = "bootstrap-dev"
    }
  }

  required_version  = "1.3.3"
}

