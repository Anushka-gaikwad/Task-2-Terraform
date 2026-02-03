First I created ec2 instance from the console manually.

and then installed teraaform and created its folder structure,
providers.tf – Configures the AWS provider
variables.tf – Defines input variables
main.tf – Creates AWS resources (VPC, Security groups, Subnet, IGW, Route Table, EC2)
outputs.tf – Exposes important outputs like EC2 public IP
SO the Purpose was to :
- Learn AWS networking fundamentals
- Understand manual vs automated infrastructure creation
- Practice Terraform best practices
