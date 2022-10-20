
data "tfe_organization" "org" {
  name = var.organization
}

#
# Credentials
#
resource "tfe_oauth_client" "base" {
  organization     = var.organization
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  service_provider = "github"
  oauth_token      = var.github_pat
}

resource "tfe_oauth_client" "k8s-cluster" {
  organization     = var.organization
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  service_provider = "github"
  oauth_token      = var.github_pat
}

resource "tfe_oauth_client" "k8s-base" {
  organization     = var.organization
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  service_provider = "github"
  oauth_token      = var.github_pat
}

#
# Workspaces
#
resource "tfe_workspace" "base" {
  name              = "base-${var.environment}"
  organization      = data.tfe_organization.org.name

  working_directory = "envs/${var.environment}/base"
  trigger_patterns  = ["envs/${var.environment}/base/*"]
  queue_all_runs    = false
  auto_apply        = true

  terraform_version = local.terraform_version

  vcs_repo {
    identifier      = "myspotontheweb/terraform-layers-demo"
    branch          = "main"
    oauth_token_id  = tfe_oauth_client.base.oauth_token_id
  }
}

resource "tfe_workspace" "k8s-cluster" {
  name              = "k8s-cluster-${var.environment}"
  organization      = data.tfe_organization.org.name

  working_directory = "envs/${var.environment}/k8s-cluster"
  trigger_patterns  = ["envs/${var.environment}/k8s-cluster/*"]
  queue_all_runs    = false
  auto_apply        = true

  terraform_version = local.terraform_version

  vcs_repo {
    identifier      = "myspotontheweb/terraform-layers-demo"
    branch          = "main"
    oauth_token_id  = tfe_oauth_client.k8s-cluster.oauth_token_id
  }
}

resource "tfe_workspace" "k8s-base" {
  name              = "k8s-base-${var.environment}"
  organization      = data.tfe_organization.org.name

  working_directory = "envs/${var.environment}/k8s-base"
  trigger_patterns  = ["envs/${var.environment}/k8s-base/*"]
  queue_all_runs    = false
  auto_apply        = true

  terraform_version = local.terraform_version

  vcs_repo {
    identifier      = "myspotontheweb/terraform-layers-demo"
    branch          = "main"
    oauth_token_id  = tfe_oauth_client.k8s-base.oauth_token_id
  }
}

#
# Configure run order
#

resource "multispace_run" "base" {
  organization = data.tfe_organization.org.name
  workspace    = "base-${var.environment}"
  depends_on   = [tfe_workspace.base]
}

resource "multispace_run" "k8s-cluster" {
  organization = data.tfe_organization.org.name
  workspace    = "k8s-cluster-${var.environment}"
  depends_on   = [tfe_workspace.k8s-cluster, multispace_run.base]
}

resource "multispace_run" "k8s-base" {
  organization = data.tfe_organization.org.name
  workspace    = "k8s-base-${var.environment}"
  depends_on   = [tfe_workspace.k8s-base, multispace_run.k8s-cluster]
}


