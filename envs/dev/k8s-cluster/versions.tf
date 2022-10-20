terraform {
  cloud {
    organization = "oconnor17-demo"

    workspaces {
      name = "k8s-cluster-dev"
    }
  }

  required_providers {
  }
}

