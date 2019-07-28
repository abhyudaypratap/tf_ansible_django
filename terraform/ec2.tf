provider "aws" {
  profile    = "default"
  region     = var.region
}

resource "aws_instance" "webapp" {
  ami           = "ami-02eac2c0129f6376b"
  instance_type = "t2.micro"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.webapp.public_ip} > ip_address.txt"
  }
}
