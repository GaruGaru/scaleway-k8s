resource "scaleway_server" "kube-master" {

  count = 1
  name = "${var.prefix}-master-${count.index + 1}"
  image = "${data.scaleway_image.debian.id}"
  type = "${var.master_instance_type}"
  public_ip = "${scaleway_ip.master_ip.ip}"

  connection {
    host = "${scaleway_server.kube-master.public_ip}"
    type = "ssh"
    user = "root"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "remote-exec" {
    scripts = [
      "scripts/kubeadm.sh"
    ]
  }


}

resource "scaleway_ip" "master_ip" {

}

