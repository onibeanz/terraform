variable "base-name" {
  type = string
  description = "base name"
}

variable "workspace-suffix" {
  type = string
  description = "workspace suffix"
}

variable "random-string" {
  type = string
  description = "random string"
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