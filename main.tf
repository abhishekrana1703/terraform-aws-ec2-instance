provider "aws" {
  region  = var.region
  profile = var.profile
}

########################
## VPC Configuration
########################

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.31.0.0/16"
}

resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.31.0.0/24"
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_internet_gateway.id
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

########################
## Security Group Configuration
########################

resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change this to restrict access to your IP for better security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

########################
## EC2 Instance Configuration
########################

resource "aws_instance" "web_server" {
  ami                    = var.ami
  instance_type         = var.instance_type
  subnet_id             = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]  # Use the new security group
  key_name              = var.key_name
  disable_api_termination = true
  associate_public_ip_address = true  # Ensure this line is included

  root_block_device {
    delete_on_termination = true
    volume_type          = "gp2"
    volume_size          = var.volume_size
  }
  tags = {
    Name = var.server_name
  }
}
