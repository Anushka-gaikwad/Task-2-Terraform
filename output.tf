output "public_ip_ec2" {
    value = aws_instance.devops.associate_public_ip_address
    
}
