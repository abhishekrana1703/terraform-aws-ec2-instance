output "public_ip" {
  description = "The public IP address of the web server instance."
  value       = aws_instance.web_server.public_ip
}

output "public_dns" {
  description = "The public DNS name of the web server instance."
  value       = aws_instance.web_server.public_dns
}


output "instance_id" {
  description = "The ID of the web server instance."
  value       = aws_instance.web_server.id
}

output "private_ip" {
  description = "The private IP address of the web server instance."
  value       = aws_instance.web_server.private_ip
}
