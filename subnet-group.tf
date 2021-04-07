/*
 database subnet group
*/

resource "aws_db_subnet_group" "apidb_subnet_group" {
  name        = "apidb_subnet_group"
  description = "apidb subnet group"
  #subnet_ids              = ["${aws_subnet.db_subnet_prv[count.index]}"]
  subnet_ids = var.private_db_subnet_ids
}