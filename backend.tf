terraform {
  backend "s3" {
    bucket = "my-tf-state-backend-bucketxyz"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    #dynamodb_table = "terraform_locks"
    #encrypt =true
  }
}
