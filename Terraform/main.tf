
# provider.tf
provider "aws" {
  region = "us-east-1"
}

# main.tf
resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example_subnet" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"
}

# output.tf
output "vpc_id" {
  value = aws_vpc.example_vpc.id
}

output "subnet_id" {
  value = aws_subnet.example_subnet.id
}
