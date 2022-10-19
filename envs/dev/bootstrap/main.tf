provider "tfe" {}

data "tfe_organization" "myspotontheweb" {
  name = "myspotontheweb"
}

resource "tfe_workspace" "governance-dev" {
  name         = "governance-dev"
  organization = data.tfe_organization.myspotontheweb.name
}

