provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "my_instance" {
    ami = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.my_security_group.id]
    #  vpc_security_group_ids = [<RESOURCETYPE>.<RESOURCENAME>.<ATTRIBUTE>]
    tags = {
        env = "dev"
    }
}

resource "aws_security_group" "my_security_group" {
    region = var.region
    description = "new sg"
    name = "new-security-group"
    ingress {
        protocol = "tcp"
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        env = "dev"
    }
    vpc_id = "vpc-0d731d69b3ef94d7f"
}

variable "image_id" {
    default = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "region" {
    default = "ap-south-1"
}

output "demo" {
    value = "my name is supriya"
}

output "public_ip" {
    value = aws_instance.my_instance.public_ip 
}
