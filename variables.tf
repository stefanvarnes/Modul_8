variable "ARM_SUBSCRIPTION_ID" {
  type = string
  description = "ARM_SUBSCRIPTION_ID"
}

variable "rg_base_name" {
  type        = string
  description = "The basename for resources and resourcegroups"
  default     = "rg-tf-demo-5"
}

variable "location" {
  type        = string
  description = "Location for where resources will be created"
  default     = "westeurope"
}

variable "saname" {
  type        = string
  description = "Storage Account name"
  default     = "tfdemomodul8"
}

variable "index_document" {
  type = string
  description = "index_document"
}

variable "source_content" {
  type = string
  description = "source content"
}