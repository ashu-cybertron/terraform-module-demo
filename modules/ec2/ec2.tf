resource "aws_instance" "web-server-instance" {
  ami               = "${var.ec2_ami}"
  instance_type     = "${var.ec2_instance_type}"
  availability_zone = "${var.ec2_availability_zone}"
  key_name          = "${var.ec2_key_name}"

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'echo your very first web server > /var/www/html/index.html'
                EOF
  tags = {
    Name = "web-server"
  }
}