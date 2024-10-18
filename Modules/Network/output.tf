output "subnet-id" {
  value = azurerm_subnet.subnet.id
  description = "value of the subnet id"
}

output "public-ip" {
  value = azurerm_public_ip.ip.ip_address
  description = "the public ip for the load balancer"
}