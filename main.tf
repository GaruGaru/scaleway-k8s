provider "scaleway" {
  organization = "<YOUR-ORGANIZATION-ID>"
  token        = "<YOUR-SECRET-TOKEN>"
  region       = "par1"
}

provider "scaleway" {
  region  = "${var.region}"
  version = "1.9.2"
}

provider "external" {
  version = "1.0.0"
}

data "scaleway_image" "debian" {
  architecture = "x86_64"
  name         = "${var.image}"
}
