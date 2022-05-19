variable "compartment_ocid" {}
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {
  default = "eu-marseille-1"
}

module "k3s_cluster" {
  region              = var.region
  availability_domain = "dTEA:EU-MARSEILLE-1-AD-1"
  compartment_ocid    = var.compartment_ocid
  my_public_ip_cidr   = "192.168.1.72/24"
  cluster_name        = "oci-k3s-cluster"
  environment         = "dev"
  k3s_token           = "gmVJMxtf3VGSTojpZBNyDRbWh3SP87l2EInZRXYCLDCl4QySuPdLJ2T"
  source              = "github.com/garutilorenzo/k3s-oci-cluster"
}

output "k3s_servers_ips" {
  value = module.k3s_cluster.k3s_servers_ips
}

output "k3s_workers_ips" {
  value = module.k3s_cluster.k3s_workers_ips
}

output "public_lb_ip" {
  value = module.k3s_cluster.public_lb_ip
}