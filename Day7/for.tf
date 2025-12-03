provider "aws" {
    region = "ap-south-1"
}


resource "aws_instance" "my-instance" {
    for_each = toset(var.ami_ids)
    ami = each.value
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-0396a91c7cb8a6325"]
}

variable "ami_ids" {
    default = ["ami-0f918f7e67a3323f0", "ami-0d0ad8bb301edb745"]
}

output "public_ip" {
    value =  [ for value in aws_instance.my-instance : value.public_ip ]
}
