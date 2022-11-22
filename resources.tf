resource "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name    = var.k8s_clustername
  region  = var.region
  version = var.k8s_version

  tags = ["k8s"]

  # This default node pool is mandatory
  node_pool {
    name       = var.k8s_poolname
    size       = "s-2vcpu-2gb"
    auto_scale = false
    node_count = 1
    tags       = ["node-pool-tag"]
  }
}