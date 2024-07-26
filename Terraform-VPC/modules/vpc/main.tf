#VPC
resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    "Name" = "terraform_vpc"
  }
}


#2 Subnets

resource "aws_subnet" "subnets" {
  count = length(var.subnet_cidr)
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  
  tags = {
    Name = var.subnet_names[count.index]
  }
}

#Internet gateway

resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "terraform_igw"
  }
}

#Route table

resource "aws_route_table" "terraform_rt" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0" #public
    gateway_id = aws_internet_gateway.terraform_igw.id
  }

  tags = {
    Name = "terraform_rt"
  }
}

#Route table association

resource "aws_route_table_association" "terraforom_rta" {
  count = length(var.subnet_cidr)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.terraform_rt.id
}