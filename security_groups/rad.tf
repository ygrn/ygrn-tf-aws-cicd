resource "aws_security_group" "rad" {
  name        = "kao-rad"
  description = "Standard RAD Security Group"
  vpc_id      = var.main_vpc_id
}

resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  protocol          = "-1"
  to_port           = 0
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]

  security_group_id = aws_security_group.rad.id
}