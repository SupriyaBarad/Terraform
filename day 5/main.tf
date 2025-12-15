
terraform {
    backend "s3" {
        bucket = "cbz-tfstate-bux"
        region = "ap-south-1"
        key = "terraform.tfstate"
    }
}
provider "aws" {
    region = "ap-south-1" 
}
resource "aws_instance" "my_instance" {
        ami = "ami-08a6efd148b1f7504"
        instance_type = "t3.micro"
}