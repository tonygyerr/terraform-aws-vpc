resource "aws_customer_gateway" "api-cgw" {
  bgp_asn    = var.vpn_bgp_asn
  ip_address = var.vpn_ip_address
  type       = "ipsec.1"
}