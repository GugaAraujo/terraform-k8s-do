output "kube-config" {
  value = digitalocean_kubernetes_cluster.k8s.kube_config.0.raw_config
  sensitive = true
}