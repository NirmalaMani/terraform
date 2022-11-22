resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "tftest"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "tftest"
  }
}


resource "aws_security_group" "sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tftest"
  }
}


resource "aws_instance" "linux" {
  ami           = var.ami
  instance_type = var.instancetype
  associate_public_ip_address = true
  key_name = var.keyname
  subnet_id = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "tftest"

  }
}
