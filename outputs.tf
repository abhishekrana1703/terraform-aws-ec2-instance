
# Outputs
output "resource_group_name" {
 value = azurerm_resource_group.example.name  # Correct the value to reference the resource group
}

output "vm_public_ip" {
 value = azurerm_network_interface.nic.ip_configuration[0].private_ip_address  # This line is fine if you're accessing the correct resource
}
