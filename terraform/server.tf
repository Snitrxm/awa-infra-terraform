# Create EC2 instance
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "my-ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "my-ec2-key"

  tags = {
    Name = "my-ec2"
  }
}

# Create SSH Key Pair to connect with EC2
resource "aws_key_pair" "my-ec2-key" {
  key_name = "my-ec2-key"
  public_key = file("~/.ssh/my-ec2-key.pub")
}