resource "digitalocean_vpc" "vpc_com" {
  name        = var.vpc_name
  region      = var.project_region
  ip_range    = "10.0.0.0/16"
  description = "Private network for communicating with the database"
}