variable "image_id" {
    default = "ami-02b8269d5e85954ef"
}
variable "instance_type"{
    default = "t2.micro"
}
variable "security_group_ids"{
    default = ["sg-0396a91c7cb8a6325"]
}
variable "key_pair"{
    default = "ubuntu_1"
}
variable "env"{
    default = "dev"
}

variable "min_size"{
    default = "2"
}
variable "max_size"{
    default = "5"
}
variable "desired_capacity"{
    default = "2"
}
variable "availability_zones"{
    default = ["ap-soth-1a","ap-south-1b",ap-south-1c"]
}
