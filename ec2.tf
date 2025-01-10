# Create an EC2 instance
resource "aws_instance" "web_server" {
  ami                    = "ami-0657605d763ac72a8" # Update with a valid AMI ID for your region
  instance_type          = "t2.micro"              # Change instance type if needed
  key_name               = "project3"              # Change to your key pair name
  subnet_id        # Use data source to retrieve an Amazon Linux 2 AMI
data "aws_ami" "amazon_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# Create an EC2 instance
resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.amazon_ami.id  # Use the data source for the AMI
  instance_type          = "t2.micro"                    # Change instance type if needed
  key_name               = "project3"                    # Change to your key pair name
  subnet_id              = aws_subnet.public_subnet_az1.id
  vpc_security_group_ids = [aws_security_group.webserver_security_group.id]  # Correct security group reference
  user_data              = file("command.sh")            # Ensure command.sh exists

  tags = {
    Name = "website-store"
  }
}      = aws_subnet.public_subnet_az1.id
  vpc_security_group_ids = [aws_security_group.project_sg.id]
  user_data              = file("command.sh")

  tags = {
    Name = "website-store"
  }
}
