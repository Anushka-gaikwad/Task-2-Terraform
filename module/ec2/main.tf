resource "aws_instance" "terraform-ec2" {
    ami = "ami-068c0051b15cdb816"
    instance_type = "t2.medium"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.sg.id]
    key_name  = aws_key_pair.ec2_key_pair.key_name
    tags = {
        Name = "my-ec2"
    }
    associate_public_ip_address = true
}

