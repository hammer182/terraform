resource "aws_vpc" "terraform" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "terraform"
  }
}

resource "aws_subnet" "terraform-pub-1" {
  vpc_id                  = aws_vpc.terraform.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "terraform-pub-1"
  }
}

resource "aws_subnet" "terraform-priv-1" {
  vpc_id                  = aws_vpc.terraform.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "terraform-priv-1"
  }
}

resource "aws_internet_gateway" "terraform-GW" {
  vpc_id = aws_vpc.terraform.id
  tags = {
    Name = "terraform-GW"
  }
}

resource "aws_route_table" "terraform-pub-RT" {
  vpc_id = aws_vpc.terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-GW.id
  }

  tags = {
    Name = "terraform-pub-RT"
  }
}

resource "aws_route_table_association" "terraform-pub-1" {
  subnet_id      = aws_subnet.terraform-pub-1.id
  route_table_id = aws_route_table.terraform-pub-RT.id
}