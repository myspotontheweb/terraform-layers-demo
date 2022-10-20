# terraform-layers-demo

Explore layered infrastructure using Terraform Cloud

## Setup

### Create "bootstrap" namespace

Create a bootstrap workspace for the environment. 

* https://app.terraform.io/app/$ORG/workspaces/new

Select "CLI-Driven Workflow"

Give the namespace one of the following names:

* bootstrap-dev
* bootstrap-prod

Finally set the workspace to have a "local" execution mode:

* https://app.terraform.io/app/$ORG/workspaces/$WORKSPACE/settings/general

### Login to Terraform Cloud

```
terraform login
```

### Create a github Personal Access Token

Following the Github intructions to generate a 

* https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token

Notes:

* Token will need "Read + Write" permissions for Webhooks (in order to trigger a workspace)

Set the following variable

```
export TF_VAR_github_pat=XXXXXX
```

## Build the project

```
cd envs/dev/bootstrap

terraform init
terraform plan
terraform apply
```


