variable "base-name" {
  type = string
  description = "base name"
}

variable "workspace-suffix" {
  type = string
  description = "workspace suffix"
}

variable "location" {
  type = string
  description = "Deployment Location"
  default = "West Europe"
}

variable "rg-name" {
  type = string
  description = "Resource Group Name"
  
}

variable "admin-password" {
  type = string
  description = "Admin Password"
  
}