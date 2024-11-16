variable "base_name" {
  type        = string
  description = "The basename for resources and resourcegroups"
}

variable "rgname" {
  type        = string
  description = "Resourcegroup name"
}

variable "scname" {
  type        = string
  description = "Resourcegroup name"
}

variable "container_access_type" {
  type = string
  description = "Container access type"
  default = "private"
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

variable "index_document" {
  type = string
  description = "index_document"
}

variable "source_content" {
  type = string
  description = "source content"
}