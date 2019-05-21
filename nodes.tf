resource "scaleway_server" "kube-node" {
  count = "${vars.nodes_count}"
  name  = "${vars.prefix}-node-${count.index + 1}"
  image = "${data.scaleway_image.debian.id}"
  type  = "${vars.master_instance_type}"
}
