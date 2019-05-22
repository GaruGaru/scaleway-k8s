provider "scaleway" {
  organization = "${var.scw_organization_id}"
  token = "${var.scw_secret_token}"
  region = "${var.region}"
  version = "1.9.2"
}

provider "external" {
  version = "1.0.0"
}

data "scaleway_image" "debian" {
  architecture = "x86_64"
  name = "${var.image}"
}
