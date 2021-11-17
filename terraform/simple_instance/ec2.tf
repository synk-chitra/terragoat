provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "c8f935f9aec0a2718cf0baecc7a17aba96ae4c2e"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-17 18:58:28"
    git_last_modified_by = "91735676+synk-chitra@users.noreply.github.com"
    git_modifiers        = "91735676+synk-chitra"
    git_org              = "synk-chitra"
    git_repo             = "terragoat"
    yor_trace            = "5537fa79-4ee3-45c4-920c-a8b274203731"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "c8f935f9aec0a2718cf0baecc7a17aba96ae4c2e"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-17 18:58:28"
    git_last_modified_by = "91735676+synk-chitra@users.noreply.github.com"
    git_modifiers        = "91735676+synk-chitra"
    git_org              = "synk-chitra"
    git_repo             = "terragoat"
    yor_trace            = "5714b4fc-80ef-4744-a9b1-66528f3e8c56"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
