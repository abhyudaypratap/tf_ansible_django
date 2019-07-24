provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_instance" "webapp" {
  ami           = "ami-02eac2c0129f6376b"
  instance_type = "t2.micro"
}
