provider "aws" {
  region = var.region
}

# Security Group
resource "aws_security_group" "sna_sg" {
  name        = "sna-terraform-sg"
  description = "Allow HTTP and SSH"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "sna_server" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sna_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y docker
    service docker start
    docker pull ${var.docker_image}
    docker run -d -p 5000:5000 ${var.docker_image}
  EOF

  tags = {
    Name = "sna-flask-server"
  }
}