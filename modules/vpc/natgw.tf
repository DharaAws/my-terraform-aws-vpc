# Create the NAT gateway in the public subnet
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.elastic_ip.id
  connectivity_type = "public"
  subnet_id = aws_subnet.public_subnets[0].id

   tags = {
    Name = "${var.product}.${var.environment}-nat_gw"
  }
}

# Allocate an Elastic IP address for the NAT gateway
resource "aws_eip" "elastic_ip" {
  vpc = true
}

