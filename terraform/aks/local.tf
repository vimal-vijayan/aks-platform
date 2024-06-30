locals {
  app_name = "optimus"
  location = "westeurope"

  workspace = {
    default = {
      env = "dev"
    },
    dev = {
      env = "dev"
    },
    stage = {
      env = "stage"
    },
    prod = {
      env = "prod"
    }
  }
  environment     = lookup(local.workspace, terraform.workspace, "false").env
  environmentvars = contains(keys(local.workspace), terraform.workspace) ? terraform.workspace : "dev"
  workspace_spec  = merge(local.workspace["dev"], local.workspace[local.environmentvars])
}
