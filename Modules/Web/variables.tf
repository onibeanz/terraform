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

variable "storage-account-tier" {
  type = string
  description = "Storage Account Tier"
}

variable "storage-account-type" {
  type = string
  description = "Storage Account Type"
}
/*
variable "index_document" {
  type        = string
  description = "Name of the index document"
  default     = "index.html"
}

variable "source_content" {
  type        = string
  description = "Source content for the index.html file"
  default     = "<h1>OperaTerra E-Commerce</h1>"
}*/