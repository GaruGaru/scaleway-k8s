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
      "scripts/install_docker.sh",
      "scripts/install_kubeadm.sh"
    ]
  }

  provisioner "remote-exec" {

    inline = [
      "sysctl net.bridge.bridge-nf-call-iptables=1",
      "kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=${self.private_ip} --apiserver-cert-extra-sans=${self.public_ip} --apiserver-extra-args=\"service-node-port-range=8000-40000\"",
      "mkdir -p $HOME/.kube",
      "cp -i /etc/kubernetes/admin.conf $HOME/.kube/config",
      "chown $(id -u):$(id -g) $HOME/.kube/config",
      "kubectl taint nodes --all node-role.kubernetes.io/master-",

      "kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/a70459be0084506e4ec919aa1c114638878db11b/Documentation/kube-flannel.yml",
      "kubectl create clusterrolebinding permissive-binding --clusterrole=cluster-admin --user=admin --user=kubelet --group=system:serviceaccounts",

      "apt-get install -y ceph-common"
    ]
  }

  provisioner "file" {
    source      = "deployments/"
    destination = "/tmp/"
  }

  provisioner "remote-exec" {

  }

}

resource "scaleway_ip" "master_ip" {
  count = 1
}

data "external" "kubeadm_join" {

  depends_on = ["scaleway_server.kube-master"]

  program = [
    "./scripts/create_join_token.sh"
  ]

  query = {
    host = "${scaleway_ip.master_ip.0.ip}"
  }

}

output "kubeadm_join_command" {
  value = "${data.external.kubeadm_join.result["command"]}"
}
