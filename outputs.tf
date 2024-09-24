output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "vm_public_ip" {
  value = azurerm_network_interface.example.ip_configuration[0].private_ip_address
}
