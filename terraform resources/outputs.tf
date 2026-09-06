output instance_public_ip {
    value = aws_instance.webserver.public_ip
}

output instance_dns_name {
    value = aws_instance.webserver.private_dns
}