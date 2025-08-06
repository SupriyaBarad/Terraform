provider "aws" {
    region = "ap-south-1"
}
resource "aws_instance" "my_instance" {
    ami = "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"
    vpc_security_group_ids= ["sg-0396a91c7cb8a6325"]
}
