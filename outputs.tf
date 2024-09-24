# Outputs
output "resource_group_name" {
  value = example-resources//
}

output "vm_public_ip" {
  value = azurerm_network_interface.nic.ip_configuration[0].private_ip_address
}
