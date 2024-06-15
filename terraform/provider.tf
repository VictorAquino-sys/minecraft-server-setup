provider "aws" {
  region = "us-west-2"
  
  assume_role {
    role_arn     = "arn:aws:iam::315870085622:role/LabRole"
    session_name = "TerraformSession"
  }
}