# output "public_ip_ec2" {
#     value = aws_instance.devops.associate_public_ip_address
    
# }
output "public_ip" {
  value = aws_instance.terraform-ec2.public_ip
}

output "private_key_pem" {
  value     = tls_private_key.ec2_key.private_key_pem
  sensitive = true
}

output "public_key_openssh" {
  value = tls_private_key.ec2_key.public_key_openssh
}

output "private_key_pem" {
  value     = tls_private_key.ec2_key.private_key_pem
  sensitive = true
}
