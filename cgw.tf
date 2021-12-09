# resource "aws_customer_gateway" "this" {
#   bgp_asn    = var.vpn_bgp_asn
#   ip_address = var.vpn_ip_address
#   type       = "ipsec.1"

#   tags = {
#     Name = "${var.app_name}-${var.environment}-cgw"
#   }
# }