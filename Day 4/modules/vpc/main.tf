resource "aws_vpc" "my_vpc"{
    cidr_block = var.vpc-cidr
    tags ={
        Name ="${var.project}-vpc"
        env = var.env
    }
}

resource "aws_subnet" "pri_sub" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.pri_sub_cidr

  tags = {
    Name = "${var.project}-pri_sub"
    env = var.env
  }
}
resource "aws_subnet" "pub_sub" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.pub_sub_cidr

  tags = {
    Name = "${var.project}-pub_sub"
    env = var.env
  }
  map_public_ip_on_launch=true
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "${var.project}-igw"
  }
}

resource "aws_default_route_table" "my-rt" {
  default_route_table_id = aws_vpc.my_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }