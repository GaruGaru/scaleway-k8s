resource "scaleway_server" "kube-node" {
  count = "${var.nodes_count}"
  name = "${var.prefix}-node-${count.index + 1}"
  image = "${data.scaleway_image.debian.id}"
  type = "${var.master_instance_type}"
}
