First I created ec2 instance from the console manually.
<img width="1920" height="1080" alt="Screenshot 2026-02-03 113241" src="https://github.com/user-attachments/assets/d3c0cda6-9980-42d9-abc2-5d5446b65b0b" />
and then installed terraform and created its folder structure,
providers.tf – Configures the AWS provider
variables.tf – Defines input variables
main.tf – Creates AWS resources (VPC, Security groups, Subnet, IGW, Route Table, EC2)
outputs.tf – Exposes important outputs like EC2 public IP
SO the Purpose was to :
- Learn AWS networking fundamentals
- Understand manual vs automated infrastructure creation
- Practice Terraform best practices
ec2 created via terrafrom - <img width="1920" height="1080" alt="Screenshot 2026-02-03 113629" src="https://github.com/user-attachments/assets/8bc6b15d-0e8c-403d-b8f4-542d9db75520" />

