provider "aws" {
  region = var.region
}

# VPC
resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "demo-vpc"
  }
}

# Subnet
resource "aws_subnet" "demo_subnet" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "demo-subnet"
  }
}

# Security Group
resource "aws_security_group" "demo_sg" {
  name   = "demo-sg"
  vpc_id = aws_vpc.demo_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "demo_instance" {

  ami           = "ami-0c7217cdde317cfec"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.demo_subnet.id
  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "terraform-demo-instance"
  }
}