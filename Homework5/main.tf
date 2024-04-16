provider aws {
  region = var.region
}

resource "aws_vpc" "kaizen" {        
  cidr_block = var.vpc_cidr[0].cidr_block

}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cidr[0].cidr
  map_public_ip_on_launch = true
  availability_zone = "${var.region}a"
  tags = {
    Name = var.subnet_cidr[0].subnet_name
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cidr[1].cidr
  map_public_ip_on_launch = true
  availability_zone = "${var.region}b"
  tags = {
    Name = var.subnet_cidr[1].subnet_name
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cidr[2].cidr
  map_public_ip_on_launch = false
  availability_zone = "${var.region}c"
  tags = {
    Name = var.subnet_cidr[2].subnet_name
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cidr[3].cidr
  map_public_ip_on_launch = false
  availability_zone = "${var.region}d"
  tags = {
    Name = var.subnet_cidr[3].subnet_name
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "homework5_igw"
  }
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.kaizen.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "private-rt"
  }
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}
