variable "region" {
  description = "AWS region where the instance will be created."
  default     = "us-east-1"
}

variable "profile" {
  description = "AWS CLI profile name to use."
  default     = "default"
}

variable "ami" {
  description = "The AMI ID to use for the instance."
  default     = "ami-0e86e20dae9224db8"  # Update with your desired AMI ID
}

variable "instance_type" {
  description = "The instance type (e.g., m5.large)."
  default     = "m5.large"
}

variable "availability_zone" {
  description = "The availability zone (e.g., us-east-1a)."
  default     = "us-east-1a"  # You can choose an AZ in your region
}

variable "key_name" {
  description = "The name of the SSH key to use."
  default     = "key"  # Change to your key pair name
}

variable "volume_size" {
  description = "The size of the root volume in GB."
  default     = 30
}

variable "server_name" {
  description = "The name to assign to the instance."
  default     = "my-instance"
}
