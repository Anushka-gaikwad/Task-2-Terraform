#generate SSH key
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
#Create AWS Key Pair using generated public key
resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "terraform-ec2-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}
#Save private key locally as .pem file
resource "local_file" "private_key" {
  content         = tls_private_key.ec2_key.private_key_pem
  filename        = "terraform-ec2-key.pem"
  file_permission = "0400"
}
