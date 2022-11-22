resource "digitalocean_kubernetes_cluster" "k8s" {
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

data "kubernetes_service_v1" "data_svc" {
  depends_on = [helm_release.nginx_ingress]

  metadata {
    name = var.data_svc_name
  }
}

resource "helm_release" "nginx_ingress" {
  depends_on = [digitalocean_kubernetes_cluster.k8s]

  name = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart = "ingress-nginx"

  set {
    name = "controller.publishService.enabled"
    value = true
  }
}

resource "helm_release" "postgres" {
  depends_on = [digitalocean_kubernetes_cluster.k8s]

  name = "postgres"
  repository = "https://charts.bitnami.com/bitnami"
  chart = "postgresql-ha"

  values = ["${file("./psql-values.yml")}"]
}