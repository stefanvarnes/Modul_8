locals {
  name = "Modul7"
  tags = {
    environment = "Demo-Modul8"
    costcenter  = "IT-Modul8"
    owner       = "Stefan Værnes"
  }

  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
  rg_name = "${var.rg_base_name}-${local.workspaces_suffix}"
}