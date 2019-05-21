variable "region" {
  default     = "ams1"
  description = "scaleway cluster region"
}

variable "image" {
  default     = "Debian Scratch"
  description = "os image for cluster vms"
}

variable "prefix" {
  default     = "kube"
  description = "resources prefix"
}

variable "nodes_count" {
  default     = 2
  description = "number of non-master nodes"
}

variable "master_instance_type" {
  type        = "string"
  default     = "DEV1-S"
  description = "kubernetes cluster master instance type"
}

variable "node_instance_type" {
  type        = "string"
  default     = "DEV1-S"
  description = "kubernetes cluster master instance type"
}
