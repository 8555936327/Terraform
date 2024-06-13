terraform {
  backend "s3" {
    bucket         = "netcats3bucket"
    key            = "infi/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}