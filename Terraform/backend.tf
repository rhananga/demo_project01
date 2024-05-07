terraform {
  backend "s3" {
    bucket         	   = "terraformstate-05072024"
    key              	   = "terraform.tfstate"
    region         	   = "us-east-1"
  }
}
