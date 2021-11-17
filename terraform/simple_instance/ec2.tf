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
    git_commit           = "469caf971a3a0cc027bee279e10c4a9f3b03e64f"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-17 19:07:34"
    git_last_modified_by = "91735676+synk-chitra@users.noreply.github.com"
    git_modifiers        = "91735676+synk-chitra"
    git_org              = "synk-chitra"
    git_repo             = "terragoat"
    yor_trace            = "ea32a86c-9452-45f6-83a8-7255d696ab9e"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "469caf971a3a0cc027bee279e10c4a9f3b03e64f"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-17 19:07:34"
    git_last_modified_by = "91735676+synk-chitra@users.noreply.github.com"
    git_modifiers        = "91735676+synk-chitra"
    git_org              = "synk-chitra"
    git_repo             = "terragoat"
    yor_trace            = "10d4177d-18e2-43ba-96aa-097d7dc3d259"
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
