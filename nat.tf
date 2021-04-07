resource "aws_nat_gateway" "api-lb-ngw" {
  count         = var.number_az
  allocation_id = element(aws_eip.api-eip-lb-ngw.*.id, count.index)
  subnet_id     = element(aws_subnet.api_subnet_pub.*.id, count.index)
  depends_on    = [aws_eip.api-eip-lb-ngw, aws_subnet.lb_subnet_prv]
  #tags {
  #  Name  = var.application}-${var.environment}-${var.aws_region}-ngw"
  #}
}