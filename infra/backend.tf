terraform {
  backend "s3" {
    bucket = "veera65"  
    key    = "aws-eks/terraform.tfstate"        
    region = "us-east-1"                       
  }
}