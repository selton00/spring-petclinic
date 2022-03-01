resource "aws_instance" "_" {
  ami                    = var.AWS_UBUNTU_AMI
  instance_type          = var.AWS_INSTANCE_TYPE
  key_name               = var.environment
  vpc_security_group_ids = [aws_security_group._.id]

  tags = {
    Name = var.environment
  }
}

resource "aws_security_group" "_" {
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  ingress {
    description = "Container web port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
