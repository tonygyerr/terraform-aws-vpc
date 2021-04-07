/*
 nat gateway eip
*/
resource "aws_eip" "api-eip-lb-ngw" {
  count = var.number_az
  vpc   = true

  lifecycle {
    create_before_destroy = true
  }
}