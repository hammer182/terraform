resource "aws_key_pair" "terraform-aws" {
  key_name   = "terraform_keypair"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "dev" {
  count                  = 2
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.TYPE
  subnet_id              = aws_subnet.terraform-pub-1.id
  key_name               = aws_key_pair.terraform-aws.key_name
  vpc_security_group_ids = ["${aws_security_group.terraform-SG.id}"]
  tags = {
    Name = "dev-${count.index}"
  }
}