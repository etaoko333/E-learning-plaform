# Create VPC and its components
# Resource means the resources we are going to use, and vpc means the identifier.
resource "aws_vpc" "vpc" {# Create VPC and its components
# Resource means the resources we are going to use, and vpc means the identifier.
resource "aws_vpc" "vpc" {
  cidr_block          = "10.0.0.0/16"
  instance_tenancy    = "default"
  enable_dns_hostnames = true # Corrected from enable_dns_hostname

  tags = {
    Name = "project-vpc"
  }
}

# Create Internet Gateway and attach to VPC. The Internet Gateway is the bridge between the VPC and the Internet to enable the instance to connect to the Internet.
# create internet gateway and attach it to vpc
# terraform aws create internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "web-IG"
  }
}
# create public subnet az1
# terraform aws create subnet
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public subnet Az1"
  }
}

# Create a route table to help route our resources to the Internet. We should have our Internet Gateway associated with it.
resource "aws_route_table" "public_route_table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags       = {
    Name     = "public route table"
  }
}

# associate public subnet az1 to "public route table"
# terraform aws associate subnet with route table
# associate public subnet az1 to "public route table"
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_az1.id
  route_table_id      = aws_route_table.public_route_table.id
}
  cidr_block          = "10.0.0.0/16"
  instance_tenancy    = "default"
  enable_dns_hostnames = true # Corrected from enable_dns_hostname

  tags = {
    Name = "project-vpc"
  }
}

# Create Internet Gateway and attach to VPC. The Internet Gateway is the bridge between the VPC and the Internet to enable the instance to connect to the Internet.
resource "aws_internet_gateway" "project_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "igw"
  }
}

resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_az1" # Fixed tag name for clarity
  }
}

# Create a route table to help route our resources to the Internet. We should have our Internet Gateway associated with it.
resource "aws_route_table" "project_route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_gateway.id
  }

  tags = {
    Name = "project-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.project_route.id
}
