resource ="aws_lb_target_group" "tg_home"{
    name ="tg_home"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
    tags = {
        env = var.env
    }
}

resource ="aws_lb_target_group" "tg_laptop"{
    name ="tg_laptop"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
    tags = {
        env = var.env
    }
    health_check {
        path = "/laptop"
    }
}

resource ="aws_lb_target_group" "tg_cloth"{
    name ="tg_cloth"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
    tags = {
        env = var.env
    }
    health_check {
        path = "/cloth"
    }
}