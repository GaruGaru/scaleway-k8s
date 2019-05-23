variable "scw_organization_id" {
  description = "scaleway account organization id"
}

variable "scw_secret_token" {
  description = "scaleway account secret token"
}

variable "region" {
  default = "par1"
  description = "scaleway cluster region"
}

variable "image" {
  default = "Debian Stretch"
  description = "os image for cluster vms"
}

variable "prefix" {
  default = "kube"
  description = "resources prefix"
}

variable "nodes_count" {
  default = 2
  description = "number of non-master nodes"
}

variable "master_instance_type" {
  type = "string"
  default = "DEV1-S"
  description = "kubernetes cluster master instance type"
}

variable "node_instance_type" {
  type = "string"
  default = "DEV1-S"
  description = "kubernetes cluster master instance type"
}
