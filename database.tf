resource "digitalocean_database_cluster" "mysql" {
  name                 = var.cluster_name
  engine               = var.cluster_engine
  version              = var.cluster_version
  size                 = var.cluster_size
  region               = var.project_region
  node_count           = var.cluster_nodes_count
  private_network_uuid = digitalocean_vpc.vpc_com.id
}

resource "digitalocean_database_db" "database" {
  cluster_id = digitalocean_database_cluster.mysql.id
  name       = var.database
}

resource "digitalocean_database_user" "username" {
  cluster_id = digitalocean_database_cluster.mysql.id
  name       = var.username
}