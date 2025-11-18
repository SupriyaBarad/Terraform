# LOADBALANCER AND AUTOSCALING

provider "aws"{
    region = "ap-south-1"
}
resource "aws_launch_template" "launch_template_home" {
    name = "launch-template-home"
    image_id = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group_ids
    user_data = <<EOF
    #!/bin/bash
    apt update -y
    apt install apache2 -y
    systemctl start apache2
    echo "Hello World" > /var/www/html/index.html
    EOF

    key_name = var.key_pair
    tags = {
        env = var.env
    }
}


