locals {
  app_name = "optimus"
  location = "westeurope"

  workspace = {
    default = {
      env = "dev"
    },
    infra-dev = {
      env = "dev"
    },
    infra-stage = {
      env = "stage"
    },
    infra-prod = {
      env = "prod"
    }
  }
  environment     = lookup(local.workspace, terraform.workspace, "false").env
  environmentvars = contains(keys(local.workspace), terraform.workspace) ? terraform.workspace : "infra-dev"
  workspace_spec  = merge(local.workspace["infra-dev"], local.workspace[local.environmentvars])
}
