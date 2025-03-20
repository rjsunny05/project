provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  tags = {
    Name = "AppServer"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ../ansible/inventory.ini"
  }
}

output "app_server_public_ip" {
  value = aws_instance.app_server.public_ip
}
