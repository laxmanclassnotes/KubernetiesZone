resource "aws_instance" "myec2" {
  #for_each                    = toset(["one", "two"])
  ami                         = "ami-02eb7a4783e7e9317"
  instance_type               = "t2.micro"
  key_name                    = "my_id_rsa"
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.first.id
  vpc_security_group_ids      = ["sg-0a650f84051a9cec5"]

  tags = {
    Name = "web"
  }
}

resource "aws_instance" "instance" {
 # for_each                    = toset(["one", "two"])
  ami                         = "ami-02eb7a4783e7e9317"
  instance_type               = "t2.micro"
  key_name                    = "my_id_rsa"
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.first.id
  vpc_security_group_ids      = ["sg-0a650f84051a9cec5"]

  tags = {
    Name = "app"
  }
}