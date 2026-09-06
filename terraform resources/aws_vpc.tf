resource aws_vpc prod_vpc {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true 
    enable_dns_hostnames = true

    tags = {
        Name = "prod-vpc"
    }
}

resource aws_subnet prod_vpc_subnet1 {
        vpc_id = aws_vpc.prod_vpc.id
        cidr_block = "10.0.1.0/24"
        availability_zone = "ap-south-1a" 
        map_public_ip_on_launch = true

        tags = {
            Name = "public-subnet"
        }
}

resource aws_subnet prod_vpc_subnet2 {
        vpc_id = aws_vpc.prod_vpc.id
        cidr_block = "10.0.2.0/24"
        availability_zone = "ap-south-1b" 
        map_public_ip_on_launch = false

        tags = {
            Name = "private-subnet"
        }
}

resource aws_internet_gateway prod_vpc_ig {
        vpc_id = aws_vpc.prod_vpc.id

        tags = {
            Name = "prod-vpc-ig"
        }
    }

resource aws_route_table public_rt {
        vpc_id = aws_vpc.prod_vpc.id

        route {
            cidr_block = "0.0.0.0/0"
            gateway_id = aws_internet_gateway.prod_vpc_ig.id
        }

        tags = {
            Name = "public-routetable"
        }
}

resource aws_route_table_association public_rt_association {
        subnet_id = aws_subnet.prod_vpc_subnet1.id
        route_table_id = aws_route_table.public_rt.id
}

resource aws_route_table private_rt {
        vpc_id = aws_vpc.prod_vpc.id

        tags = {
            Name = "private-routetable"
        }
}

resource aws_route_table_association private_rt_association {
        subnet_id = aws_subnet.prod_vpc_subnet2.id
        route_table_id = aws_route_table.private_rt.id
}

resource aws_security_group prod_vpc_sg {
        name = "SG-1"
        description = "Allow SSH, HTTP, HTTPS"
        vpc_id = aws_vpc.prod_vpc.id

        ingress {
            description = "Allow SSH"
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
            description = "Allow HTTP"
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }

         ingress {
            description = "Allow HTTPS"
            from_port = 443
            to_port = 443
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }

        egress {
            description = "Allow all outbound traffic" 
            from_port = 0 
            to_port = 0 
            protocol = "-1" 
            cidr_blocks = ["0.0.0.0/0"]
        }

        tags = {
            Name = "prod-vpc-sg"
        }

}
