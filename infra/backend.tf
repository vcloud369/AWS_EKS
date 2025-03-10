terraform{
  backend "s3" {
    bucket         = "sneha-terraform-bucket-us-west-2"
    key            = "usecase7eks/terraform.tfvars"
    region         = "us-west-2"
    encrypt        = true
  }
}



