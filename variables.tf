variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location for the resources"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the virtual machine"
  type        = string
}
