resource "aws_key_pair" "archone-key" {
  key_name   = "archonekey"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "archone-web" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.archone-pub-1.id
  key_name               = aws_key_pair.archone-key.key_name
  vpc_security_group_ids = [aws_security_group.archone_stack_sg.id]
  tags = {
    Name = "my-archone"
  }
}

resource "aws_ebs_volume" "vol_4_archone" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "extr-vol-4-archone"
  }
}

resource "aws_volume_attachment" "atch_vol_archone" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_archone.id
  instance_id = aws_instance.archone-web.id
}

output "PublicIP" {
  value = aws_instance.archone-web.public_ip
}