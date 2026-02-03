resource "aws_vpc" "test" {
    cidr_block = var.cidr_block
    tags = {
        Name = "my-vpc"
    }
}

# security group creation

resource "aws_security_group" "sg" {
     name = "tf_sg"
     vpc_id = aws_vpc.test.vpc_id

   ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/16"]
   }
   ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/16"]
   }
   ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/16"]
   }
   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
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

## ec2 creation

resource "aws_instance" "my-ec2" {
    ami = "ami-068c0051b15cdb816"
    instance_type = "t2.micro"
    key_name  = "linux.pem"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = aws_security_group.sg.id
    tags = {
        Name = "my-terraform-ec2"
    }
    associate_public_ip_address = true
}
