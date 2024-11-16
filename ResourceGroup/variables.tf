variable "base_name" {
  type        = string
  description = "The basename for resources and resourcegroups"
  default     = "rg-tf-demo-5"
}

variable "location" {
  type        = string
  description = "Location for where resources will be created"
  default     = "westeurope"
}

variable "tags" {
  type        = map(string)
  description = "TAGS to be applied to the resources"
}
