terraform {
  cloud {
    organization = "oconnor17-demo"

    workspaces {
      name = "k8s-base-dev"
    }
  }

  required_providers {
  }
}

