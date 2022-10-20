
module "bootstrap" {
  source = "../../../modules/bootstrap"

  organization = var.organization
  environment  = var.environment
  github_pat   = var.github_pat
}

