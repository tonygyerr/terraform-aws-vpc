/*
  egress only internet gateway
*/

resource "aws_egress_only_internet_gateway" "api-egress" {
  #vpc_id = "${aws_vpc.api-vpc}.[count.index]"
  vpc_id = aws_vpc.api-vpc.id
}
