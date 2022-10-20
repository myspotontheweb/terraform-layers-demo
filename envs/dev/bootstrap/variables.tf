variable "organization" {
  type = string
  description = "The Terraform cloud organisation being used"
}

variable "environment" {
  type    = string
  description = "The environment id which the workspace is associated with"
}

variable "github-pat" {
  type = string
  description = "Github Personal Access Token"
}

