resource "aws_eip" "this" {
  count = var.number_az
  vpc   = true

  lifecycle {
    create_before_destroy = true
  }
}