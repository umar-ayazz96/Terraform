resource aws_instance ubuntu_ec2 {

    ami = var.ec2_ami
    instance_type = var.ec2_instance_type
    subnet_id = aws_subnet.prod_vpc_subnet1.id
    associate_public_ip_address = true
    key_name = "Linux_KP"
    vpc_security_group_ids = [aws_security_group.prod_vpc_sg.id]

    tags = {
        Name = "linux_srvr"
    }

}