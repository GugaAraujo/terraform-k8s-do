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

resource "digitalocean_app" "this" {
  spec {
    domain {
      name = var.domain_name
    }
    name   = var.app_name
    region = var.project_region

    service {
      name               = var.app_name
      http_port          = 80
      instance_count     = 1
      instance_size_slug = var.app_size
      internal_ports     = []
      source_dir         = "/"

      image {
        registry_type = "DOCKER_HUB"
        repository    = "wordpress"
        tag           = var.app_version_tag
      }
    }
  }
}

data "digitalocean_app" "this-data" {
  app_id = digitalocean_app.this.id
}
