
resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }
  #     ingress { # incoming connnection only on port (Inbound traffic originates from outside the network)
  #   description      = "HTTP from VPC"
  #   from_port        = 80
  #   to_port          = 80
  #   protocol         = "tcp"
  #   cidr_blocks = [
  #     "10.0.0.0/8",
  #   ]
  # }
  tags = {
    Name = "${var.owner}-worker-1"
  }
}

resource "aws_security_group" "worker_group_mgmt_two" {
  name_prefix = "worker_group_mgmt_two"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "192.168.0.0/16",
    ]
  }

  #     ingress { # incoming connnection only on port (Inbound traffic originates from outside the network)
  #   description      = "HTTP from VPC"
  #   from_port        = 80
  #   to_port          = 80
  #   protocol         = "tcp"
  #   cidr_blocks = [
  #     "192.168.0.0/16",
  #   ]
  # }
 tags = {
    Name = "${var.owner}-worker-2"
  }
}

resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
      "192.168.0.0/16",
      "172.16.0.0/12",
    ]
  }

      ingress { # incoming connnection only on port (Inbound traffic originates from outside the network)
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks = [
      "10.0.0.0/8",
      "192.168.0.0/16",
      "172.16.0.0/12",
    ]
  }
   tags = {
    Name = "${var.owner}-worker-all"
  }
}
