# Create a new instance of the latest Ubuntu 18.04 on an
# t2.micro node with an AWS Tag naming it "Jenkins-server"

resource "aws_instance" "Jenkins_V2" {
  ami           = "ami-02df9ea15c1778c9c"
  instance_type = "t2.micro"
  key_name 	= "key_terraform"
  vpc_security_group_ids = [
                  "${aws_security_group.allow_ssh.id}",
                  "${aws_security_group.nginx_jenkins_port.id}"
]

provisioner "file" {
	source="install_ansible.sh"
	destination="/tmp/install_ansible.sh"
}

provisioner "remote-exec" {
	inline=[
	"chmod +x /tmp/install_ansible.sh",
	"sudo /tmp/install_ansible.sh"
]
}

connection {
	host = self.public_ip
	user="ubuntu"
	private_key="${file("key_terraform.pem")}"
}

  tags = {
    Name = "Jenkins-server_V2"
  }
}
