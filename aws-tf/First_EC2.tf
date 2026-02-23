
resource "aws_instance" "myEC2" {
    ami           = "ami-0f3caa1cf4417e51b"
    instance_type = "t2.micro"
}