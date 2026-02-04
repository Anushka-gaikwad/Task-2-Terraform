resource "aws_vpc" "test" {
    cidr_block = var.cidr_block
    tags = {
        Name = "my-vpc"
    }
}

## internet gateway

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.test.id
}

## public subnet

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.test.id
    cidr_block = var.public_cidr
    availability_zone =  us-east-1b
    tags = {
        Name = "public-automation"
    }
}
## private subnet
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.test.id
    cidr_block = var.private_cidr
    availability_zone = us-east-1a
    tags = {
        Name = "private-subnet"
    }
}
### route table
resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.test.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

## subnet association

resource "aws_route_table_association" "ass" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public-rt.id
  
}
