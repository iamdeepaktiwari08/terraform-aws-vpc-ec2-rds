resource "aws_db_subnet_group" "rds_subnet" {
  name = "rds-subnet"

  subnet_ids = [
    aws_subnet.private_subnet.id,
    aws_subnet.private_subnet_2.id
  ]

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "password123"

  db_subnet_group_name = aws_db_subnet_group.rds_subnet.name
  skip_final_snapshot  = true
}