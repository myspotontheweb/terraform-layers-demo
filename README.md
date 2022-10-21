# terraform-layers-demo

Explore layered infrastructure using Terraform Cloud

## Setup

### Login to Terraform Cloud

```
terraform login
```

Notes:

* You will need organisation "OWNER" role to create workspaces within a Terraform cloud organisation.

### Create "bootstrap" workspace

Create a bootstrap workspace for the environment, via the Terraform Cloud UI

* https://app.terraform.io/app/$ORG/workspaces/new

Select "CLI-Driven Workflow"

Give the namespace one of the following names:

* bootstrap-dev
* bootstrap-prod

Set the workspace to have a "local" execution mode. We want to run Terraform from the local laptop, which has the credentials to update TFC ("terraform login" above)

* https://app.terraform.io/app/$ORG/workspaces/$WORKSPACE/settings/general

### Create a github Personal Access Token

We'll need a Github PAT in order to setup webhooks for each workspace, in order to detect commits in the source repo(s)
Follow this documentation

* https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token

The token will need the following permissions:


| Permission | Access         |
| ---------- | -------------- |
| Contents   | Read-only      |
| Metadata   | Read-only      |
| Webhooks   | Read and write |


To use the Token, set the following environment variable:

```
export TF_VAR_github_pat=XXXXXX
```

Alternatively it can be entered as a variable on the bootstrap workspace.

## Build the project

```
cd envs/dev/bootstrap

terraform init
terraform plan
terraform apply
```


