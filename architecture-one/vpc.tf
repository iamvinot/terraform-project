resource "aws_vpc" "archone" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "archone-vpc"
  }
}

resource "aws_subnet" "archone-pub-1" {
  vpc_id                  = aws_vpc.archone.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "archone-pub-1"
  }
}

resource "aws_subnet" "archone-pub-2" {
  vpc_id                  = aws_vpc.archone.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "archone-pub-2"
  }
}


resource "aws_subnet" "archone-pub-3" {
  vpc_id                  = aws_vpc.archone.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "archone-pub-3"
  }
}


resource "aws_subnet" "archone-priv-1" {
  vpc_id                  = aws_vpc.archone.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "archone-priv-1"
  }
}


resource "aws_subnet" "archone-priv-2" {
  vpc_id                  = aws_vpc.archone.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "archone-priv-2"
  }
}


resource "aws_subnet" "archone-priv-3" {
  vpc_id                  = aws_vpc.archone.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "archone-priv-3"
  }
}

resource "aws_internet_gateway" "archone-IGW" {
  vpc_id = aws_vpc.archone.id
  tags = {
    Name = "archone-IGW"
  }
}

resource "aws_route_table" "archone-pub-RT" {
  vpc_id = aws_vpc.archone.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.archone-IGW.id
  }

  tags = {
    Name = "archone-pub-RT"
  }
}


resource "aws_route_table_association" "archone-pub-1-a" {
  subnet_id      = aws_subnet.archone-pub-1.id
  route_table_id = aws_route_table.archone-pub-RT.id
}

resource "aws_route_table_association" "archone-pub-2-a" {
  subnet_id      = aws_subnet.archone-pub-2.id
  route_table_id = aws_route_table.archone-pub-RT.id
}
resource "aws_route_table_association" "archone-pub-3-a" {
  subnet_id      = aws_subnet.archone-pub-3.id
  route_table_id = aws_route_table.archone-pub-RT.id
}