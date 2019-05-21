resource "scaleway_server" "kube-master" {
  count = 1
  name  = "${vars.prefix}-master-${count.index + 1}"
  image = "${data.scaleway_image.debian.id}"
  type  = "${vars.master_instance_type}"
}
