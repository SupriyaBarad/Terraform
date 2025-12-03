provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "my-instance" {
    ami = "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-0396a91c7cb8a6325"]
    key_name = "ubuntu"

    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("ubuntu.pem")
        host = self.public_ip
    }
    provisioner "local-exec" {
        command = "touch abc.txt"
    }

    provisioner "file" {
        source = "web.sh"
        destination = "/home/ubuntu/web.sh"
    }

    provisioner "remote-exec" {
#        command = "bash /home/ubuntu/web.sh"
        inline = [
            "bash /home/ubuntu/web.sh",
            "touch demo.txt"
        ]
    }
}
