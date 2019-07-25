provider "aws" {
  profile    = "default"
  region     = var.region
}

resource "aws_instance" "webapp" {
  ami           = "ami-02eac2c0129f6376b"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.webapp.public_ip} > ip_address.txt"
  }
}
