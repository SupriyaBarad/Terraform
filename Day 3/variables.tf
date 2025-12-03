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
    default = ["ap-soth-1a","ap-south-1b"]
}
variable "vpc_id"{
    default = "vpc-0d731d69b3ef94d7f"
}

variable "subnets"{
    default =["subnet-0b49fd63dd2bab41a","subnet-010654d024380b234","subnet-02a4fddd2def35ba5"]
}