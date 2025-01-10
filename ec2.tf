# Create an EC2 instance
resource "aws_instance" "web_server" {
  ami                    = "ami-0657605d763ac72a8" # Update with a valid AMI ID for your region
  instance_type          = "t2.micro"              # Change instance type if needed
  key_name               = "project3"              # Change to your key pair name
  subnet_id              = aws_subnet.public_subnet_az1.id
  vpc_securiyu_group_ids = [aws_security_group.project_sg.id]
  user_data              = file("command.sh")

  tags = {
    Name = "website-store"
  }
}