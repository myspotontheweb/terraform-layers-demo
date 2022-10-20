provider "tfe" {
}
data "tfe_organization" "org" {
  name = var.organization
}

resource "tfe_oauth_client" "github" {
  organization     = var.organization
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  service_provider = "github"
  oauth_token      = "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"
}

resource "tfe_workspace" "base" {
  name         = "base-${var.environment}"
  organization = data.tfe_organization.org.name
  working_directory = "envs/dev/base"
  auto_apply   = true
  trigger_patterns = ["envs/dev/base/*"]

  vcs_repo {
    identifier      = "myspotontheweb/terraform-layers-demo"
    branch          = "init-code"
    oauth_token_id  = tfe_oauth_client.github.oauth_token_id
  }
}

