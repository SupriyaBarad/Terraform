# LOADBALANCER AND AUTOSCALING

provider "aws"{
    region = "ap-south-1"
}
resource "aws_launch_template" "launch_template_home" {
    name = "launch-template-home"
    image_id = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group_ids
    user_data = <<EOT
    #!/bin/bash
    apt update -y
    apt install apache2 -y
    systemctl start apache2
    echo "Hello World" > /var/www/html/index.html
    EOT

    key_name = var.key_pair
    tags = {
        env = var.env
    }
}


resource "aws_launch_template" "launch_template_cloth" {
    name = "launch-template-cloth"
    image_id = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group_ids
    user_data = <<EOT
    #!/bin/bash
    apt update -y
    apt install apache2 -y
    systemctl start apache2
    mkdir /var/www/html/cloth
    echo "Hello from Cloth" > /var/www/html/cloth/index.html
    EOT

    key_name = var.key_pair
    tags = {
        env = var.env
    }
}


resource "aws_launch_template" "launch_template_laptop" {
    name = "launch-template-laptop"
    image_id = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group_ids
    user_data = <<EOT
    #!/bin/bash
    apt update -y
    apt install apache2 -y
    systemctl start apache2
    mkdir /var/www/html/laptop
    echo "Hello from Laptop" > /var/www/html/laptop/index.html
    EOT

    key_name = var.key_pair
    tags = {
        env = var.env
    }
}



resource "aws_autoscaling_group" "asg-home" {
    name = "asg-home"
    min_size = var.min_size
    max_size = var.max_size
    desired_capacity = var.desired_capacity
    launch_template = {
        id = aws_launch_template.launch_template_home.id
    }
    availability_zones = var.availability_zones
    tag {
        env = var.env
    }

}

resource "aws_autoscaling_policy""asp-home"{
    name = "asp-home"
    autoscaling_group_name = ws_autoscaling_group.asg-home.name
    policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
        predefined_metric_type {
            predefined_metric_type = "CPUUtilization"
        }
        target_value = 50
    }
}



resource "aws_autoscaling_group" "asg-laptop" {
    name = "asg-laptop"
    min_size = var.min_size
    max_size = var.max_size
    desired_capacity = var.desired_capacity
    launch_template = {
        id = aws_launch_template.launch_template_laptop.id
    }
    availability_zones = var.availability_zones
    tag {
        env = var.env
    }

}

resource "aws_autoscaling_policy""asp-laptop"{
    name = "asp-cloth"
    autoscaling_group_name = ws_autoscaling_group.asg-laptop.name
    policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
        predefined_metric_type {
            predefined_metric_type = "CPUUtilization"
        }
        target_value = 50
    }
}



resource "aws_autoscaling_group" "asg-cloth" {
    name = "asg-cloth"
    min_size = var.min_size
    max_size = var.max_size
    desired_capacity = var.desired_capacity
    launch_template = {
        id = aws_launch_template.launch_template_cloth.id
    }
    availability_zones = var.availability_zones
    tag {
        env = var.env
    }

}

resource "aws_autoscaling_policy""asp-cloth"{
    name = "asp-cloth"
    autoscaling_group_name = ws_autoscaling_group.asg-cloth.name
    policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
        predefined_metric_type {
            predefined_metric_type = "CPUUtilization"
        }
        target_value = 50
    }
}