variable "base-name" {
  type = string
  description = "Storage Account Name"
}

variable "location" {
  type = string
  description = "Deployment Location"
  default = "West Europe"
}

variable "rg-name" {
  type = string
  description = "value of the resource group name"
}