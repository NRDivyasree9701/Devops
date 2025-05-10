vpc_id = "vpc-022aaaa5395d4b938"

security_groups = {
  "web_sg" = {
    description = "Security group for web servers"
    ingress = [
      { from_port = 80, to_port = 80, ip_protocol = "tcp", cidr_ipv4 = "0.0.0.0/0" },
      { from_port = 443, to_port = 443, ip_protocol = "tcp", cidr_ipv4 = "0.0.0.0/0" }
    ]
    egress = [
      { from_port = 0, to_port = 0, ip_protocol = "-1", cidr_ipv4 = "0.0.0.0/0" }
    ]
  }
  "db_sg" = {
    description = "Security group for database servers"
    ingress = [
      { from_port = 3306, to_port = 3306, ip_protocol = "tcp", cidr_ipv4 = "10.0.0.0/16" }
    ]
    egress = [
      { from_port = 0, to_port = 0, ip_protocol = "-1", cidr_ipv4 = "0.0.0.0/0" }
    ]
  }
}
