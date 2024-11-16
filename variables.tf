variable "ARM_SUBSCRIPTION_ID" {
  type = string
  description = "ARM_SUBSCRIPTION_ID"
  default = "secrets.ARM_CLIENT_ID"
}

variable "rg_base_name" {
  type        = string
  description = "The basename for resources and resourcegroups"
  default     = "rg-tfdemo-modul7-sv"
}

variable "location" {
  type        = string
  description = "Location for where resources will be created"
  default     = "westeurope"
}

variable "saname" {
  type        = string
  description = "Storage Account name"
  default     = "satfbackendsv"
}

variable "index_document" {
  type = string
  description = "index_document"
  default = "index.html"
}

variable "source_content" {
  type = string
  description = "source content"
  default = "<h1>Web page created with Terraform</h1>"
}