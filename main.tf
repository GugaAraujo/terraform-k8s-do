terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.21.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.11.0"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.6.0"
    }
  }
}

provider "digitalocean"{
  token = var.do_token
}

provider "kubernetes" {
  host = digitalocean_kubernetes_cluster.k8s.endpoint
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate
  )

  exec {
  api_version = "client.authentication.k8s.io/v1beta1"
  command = "doctl"
  args = ["kubernetes", "cluster", "kubeconfig", "exec-credential",
  "--version=v1beta1", digitalocean_kubernetes_cluster.k8s.id]
}
}

provider "helm" {
  debug = true
  kubernetes {
    host = digitalocean_kubernetes_cluster.k8s.endpoint
    cluster_ca_certificate = base64decode(
      digitalocean_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate
    )

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command = "doctl"
      args = ["kubernetes", "cluster", "kubeconfig", "exec-credential",
      "--version=v1beta1", digitalocean_kubernetes_cluster.k8s.id]
    }
  }
}
