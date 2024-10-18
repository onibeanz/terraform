variable "base-name" {
  type = string
  description = "Storage Account Name"
}

variable "location" {
  type = string
  description = "Deployment Location"
  default = "West Europe"
}

variable "storage-account-tier" {
  type = string
  description = "Storage Account Tier"
}

variable "storage-account-type" {
  type = string
  description = "Storage Account Type"
}