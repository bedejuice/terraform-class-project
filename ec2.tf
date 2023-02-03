#create EC2 instance 
# variable "security_group_id" {}

# data "aws_security_group" "sg" {
#   id = "${var.security_group_id}"
# }

resource "aws_instance" "tf_demo" {
  count         = 4 #create two EC2 instances
  ami           = "ami-0ceecbb0f30a902a6"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.pub_subnet.id
  vpc_security_group_ids = [
    aws_security_group.sg.id
  ]


  tags = {
    Name = "tf_demo ${count.index}"
  }
}