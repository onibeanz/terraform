# Specifies the deployment location for the resources.
variable "location" {
  type        = string
  description = "Deployment Location"
  default     = "West Europe" # Default location is set to "West Europe"
}

# Specifies the base name for the resources.
variable "base-name" {
  type        = string
  description = "Base Name"
  default = "default" # Default base name is set to "default"
}

# Specifies the tier of the storage account.
variable "storage-account-tier" {
  type        = string
  description = "Storage Account Tier"
  default     = "Standard" # Default storage account tier is set to "Standard"
}

# Specifies the type of the storage account.
variable "storage-account-type" {
  type        = string
  description = "Storage Account Type"
  default     = "GRS" # Default storage account type is set to "GRS"
}

/*
# Specifies the size of the virtual machine.
# The map contains different sizes: small, medium, and large.
variable "vm-size" {
  type = map
  default = {
    "small"  = "Standard_B1s"  # Small VM size
    "medium" = "Standard_B2s"  # Medium VM size
    "large"  = "Standard_B4ms" # Large VM size
  }
}

# Specifies the username for the virtual machine.
variable "vm-username" {
  type        = string
  description = "VM Username"
}

# Specifies the password for the virtual machine.
variable "vm-password" {
  type        = string
  description = "VM Password"
}

*/