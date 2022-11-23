resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = var.k8s_clustername
  region  = var.project_region
  version = var.k8s_version
  tags = var.k8s_tag

  # This default node pool is mandatory
  node_pool {
    name       = var.k8s_poolname
    size       = var.node_size
    auto_scale = false
    node_count = var.node_total
    tags       = var.node_pool_tag
  }
}

resource "helm_release" "cert-manager" {
  depends_on = [digitalocean_kubernetes_cluster.k8s]

  name = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart = "cert-manager"
  namespace = "cert-manager"
  create_namespace = true
  version = "1.8.0"

  set {
    name = "installCRDs"
    value = true
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
