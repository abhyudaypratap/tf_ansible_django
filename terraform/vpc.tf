resource "aws_vpc" "primary" {
  cidr_block = "10.1.0.0/16"

  provisioner "local-exec" {
    command = "echo {aws_vpc.primary.id} > .env"
  }
}
