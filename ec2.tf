resource "aws_instance" "web1" {
    ami = "${loopup(var.AMI,var.region)}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.prod-subnet-public-1.id}"
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
    key_name = "${aws_key_pair.N. Virginia-region-key-pair.id}"
    provisioner "file" {
        source = "nginx.sh"
        destination = "/tmp/nginx.sh"
      
    }
    provisioner "remote-exec" {
        inline = [ 
            "chmod +x  /tmp/nginx.sh",
            "sudo /tmp/nginx.sh"
         ]
    }

    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }

resource "aws_key_pair" "Virginia-region-key-pair" {
    key_name = "Virginia-region-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
 
}
}