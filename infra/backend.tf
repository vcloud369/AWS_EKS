terraform{
  backend "s3" {
    bucket         = "manikanta-terraform-state-bucket"
    key            = "eks-demo/terraform.tfvars"
    region         = "ap-south-1"
    encrypt        = true
  }
}



