resource "aws_vpc" "minecraft_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "minecraft_vpc"
  }
}

resource "aws_subnet" "minecraft_subnet" {
  vpc_id            = aws_vpc.minecraft_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone  = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "minecraft_subnet"
  }
}

resource "aws_internet_gateway" "minecraft_gw" {
  vpc_id = aws_vpc.minecraft_vpc.id

  tags = {
    Name = "minecraft_gw"
  }
}

resource "aws_route_table" "minecraft_rt" {
  vpc_id = aws_vpc.minecraft_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.minecraft_gw.id
  }

  tags = {
    Name = "minecraft_rt"
  }
}

resource "aws_security_group" "minecraft_sg" {
  name        = "minecraft_sg"
  description = "Allow Minecraft traffic"
  vpc_id      = aws_vpc.minecraft_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "minecraft_server" {
  ami           = "ami-0cf2b4e024cdb6960"
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.minecraft_subnet.id
  security_groups = [aws_security_group.minecraft_sg.id]
  key_name = "mykeypair"

  tags = {
    Name = "MinecraftServer"
  }
}