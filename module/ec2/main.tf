resource "aws_instance" "devops" {
    ami = "ami-068c0051b15cdb816"
    instance_type = "t2.micro"
    key_name  = "N.verginia-key"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = aws_security_group.sg.id
    tags = {
        Name = "auto-ec2"
    }
    associate_public_ip_address = true
}

