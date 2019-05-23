resource "scaleway_server" "kube-node" {
  count = "${var.nodes_count}"
  name = "${var.prefix}-node-${count.index + 1}"
  image = "${data.scaleway_image.debian.id}"
  type = "${var.master_instance_type}"
  public_ip = "${element(scaleway_ip.node_ip.*.ip, count.index)}"
  depends_on = ["scaleway_server.kube-master"]

  connection {
    type = "ssh"
    user = "root"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "remote-exec" {
    scripts = [
      "scripts/install_docker.sh",
      "scripts/install_kubeadm.sh",
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "${data.external.kubeadm_join.result.command}"
    ]
  }

}

resource "scaleway_ip" "node_ip" {
  count = "${var.nodes_count}"
}
