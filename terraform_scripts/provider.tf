# Configure AWS as resources Provider
provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/home/melladoj/terraform_scripts/credentials"
  profile                 = "default"
}
