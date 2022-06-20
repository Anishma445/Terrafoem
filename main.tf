provider "aws" {
	region= "us-east-2"
}

resource "aws_key_pair" "honey" {
	key_name   = "abcd"
	public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjH6a4bBUb6EcEfvbFcXRiUKn4s3Vk/IwzFRzjo2GOHvLqgfspcknaYRUXt3lBeDdcL3XY01IE8juMuRBdk8MtAeMHfkkApjovU0ezjzmGwjoDvgqGd32Bpodam2wTTbg7El6qQdxz9ozXzClXnDJvXS3TAdWDIFt0YyLAiBMfoiWi0Xmb7vGhRYDDy2+0bc/NK++iLb7EUKBB/GPWAjDoZHNLdMk7TUAdbx8PyvJJbs1gofNrFs48ErKBoVD4s4e2xJsnzqj0LlNAfKZRmn0SkxPsBUk/aWvBUnOQK8GHGCXYJGC38qjPqi4obB/HfesMp2M1kPRqfPDtnM0vjOfx KEY"
}




resource "aws_instance" "web" {
  ami             = "ami-002068ed284fb165b"
  instance_type   = "t2.micro"
  key_name        = "${lookup(var.key_name,var.env)}"
  security_groups = ["ssh-http"]
  count           = 2
  tags = {
    Name = "${lookup(var.ec2-name,var.env)}"
  }
}

