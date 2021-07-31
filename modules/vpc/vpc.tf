// VPC
resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr_block}"
  tags = {
    Name = "main"
  }
}


// IGW
resource "aws_internet_gateway" "main" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "myigw"
  }
}


//ROUTE
resource "aws_route_table" "main" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.vpc_aws_internet_gateway_id}"
  }


  tags = {
    Name = "my_route_table"
  }
}


// SUBNET 
resource "aws_subnet" "main" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.vpc_subnet_cidr_block}"

  tags = {
    Name = "Main"
  }
}

// subnet association
resource "aws_route_table_association" "main" {
  subnet_id      =  "${var.vpc_subnet_id}"
  route_table_id = "${var.vpc_route_table_id}"
}

// SG
resource "aws_security_group" "main" {
  name        = "my_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "FOR SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_sg"
  }
}

