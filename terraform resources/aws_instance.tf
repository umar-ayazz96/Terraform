resource aws_instance webserver {
    ami = var.ec2_ami
    instance_type = var.ec2_instance_type
    associate_public_ip_address = true
    availability_zone = "ap-south-1a"
    key_name                             = "Linux_KP"
    ebs_optimized = true
    
    credit_specification { 
        cpu_credits = "unlimited" 
    }
    
    root_block_device { 
        delete_on_termination = true 
        encrypted = false 
        volume_size = 8 
        volume_type = "gp3" 
    }

    tags = {
        Name = "webserver"
    }

}