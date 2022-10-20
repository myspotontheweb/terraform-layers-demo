# terraform-layers-demo

Explore layered infrastructure using Terraform Cloud

## Setup

### Login to Terraform Cloud

```
terraform login
```

### Create "bootstrap" namespace

Create a bootstrap workspace for the environment. 

* https://app.terraform.io/app/$ORG/workspaces/new

Select "CLI-Driven Workflow"

Give the namespace one of the following names:

* bootstrap-dev
* bootstrap-prod

Finally set the workspace to have a "local" execution mode:

* https://app.terraform.io/app/$ORG/workspaces/$WORKSPACE/settings/general


### Create a github Personal Access Token

Following the Github intructions create a Personal access token 

* https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token

with the following permissions


| Permission | Access         |
| ---------- | -------------- |
| Contents   | Read-only      |
| Metadata   | Read-only      |
| Webhooks   | Read and write |


Set the following variable

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


