
# provider.tf
provider "aws" {
  region = "us-east-1"
}

# main.tf
resource "aws_vpc" "testvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "testsubnet" {
  vpc_id     = aws_vpc.testvpc.id
  cidr_block = "10.0.1.0/24"
}

# output.tf
output "vpc_id" {
  value = aws_vpc.testvpc.id
}

output "subnet_id" {
  value = aws_subnet.testsubnet.id
}
