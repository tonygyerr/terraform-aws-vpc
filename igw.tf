/*
 internet gateway
*/
resource "aws_internet_gateway" "api-ig" {
  #vpc_id = "${aws_vpc.api-vpc}.[count.index]"
  vpc_id = aws_vpc.api-vpc.id
}