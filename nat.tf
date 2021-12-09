resource "aws_nat_gateway" "this" {
  count         = var.number_az
  allocation_id = element(aws_eip.this.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  depends_on    = [aws_eip.this, aws_subnet.lb_private]
  tags = {
    Name = "${var.app_name}-${var.environment}-lb-${count.index}-ngw"
  }
}