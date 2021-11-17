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
    git_commit           = "9cd9a99a91261f1221f565522574ef9f10fc8eb0"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-17 18:46:37"
    git_last_modified_by = "91735676+synk-chitra@users.noreply.github.com"
    git_modifiers        = "91735676+synk-chitra"
    git_org              = "synk-chitra"
    git_repo             = "terragoat"
    yor_trace            = "4f0f2893-b28c-45b1-8a53-4a81ef23e9ca"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "9cd9a99a91261f1221f565522574ef9f10fc8eb0"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-17 18:46:37"
    git_last_modified_by = "91735676+synk-chitra@users.noreply.github.com"
    git_modifiers        = "91735676+synk-chitra"
    git_org              = "synk-chitra"
    git_repo             = "terragoat"
    yor_trace            = "b2c18879-d021-4a1a-81e6-a8588754085b"
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
