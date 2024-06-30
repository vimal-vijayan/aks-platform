locals {
  app_name = "optimus"
  location = "westeurope"

  workspace = {
    default = {
      env = "dev"
    },
    aks-dev = {
      env = "dev"
    },
    aks-stage = {
      env = "stage"
    },
    aks-prod = {
      env = "prod"
    }
  }
  environment     = lookup(local.workspace, terraform.workspace, "false").env
  environmentvars = contains(keys(local.workspace), terraform.workspace) ? terraform.workspace : "aks-dev"
  workspace_spec  = merge(local.workspace["aks-dev"], local.workspace[local.environmentvars])
}
