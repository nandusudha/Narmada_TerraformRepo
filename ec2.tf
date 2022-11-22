data "aws_vpc" "main" {
    filter {
        name = "tag:Name"
        values = ["Default-VPC"]
    }
}
 
data "aws_subnet" "main" {
  filter {
        name = "tag:Name"
        values = ["subnet1"]

    }
}
resource "aws_security_group" "sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
    
  }

  egress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "allow_tls"
  }
}
resource "aws_s3_bucket" "bucket1" {
  bucket = "nandu2-bucket"

  tags = {
    Name        = "narmada2 bucket"
    Environment = "Dev"
  }
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instancetype
  associate_public_ip_address = true
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = data.aws_subnet.main.id
  tags = {
    Name = var.Name
  }
}