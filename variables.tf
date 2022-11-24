variable "do_token" {}

variable "domain_name" {
  type = string
  description = "Name of the domain"
  default = "laboratoriolotus.com.br"
}

variable "app_name" {
  type = string
  description = "Name of the application"
  default = "application"
}

variable "app_size" {
  type = string
  description = "size of the application"
  default = "basic-xxs"
}

variable "app_version_tag" {
  type = string
  description = "Tag of the application"
  default = "php8.1-apache"
}

variable "data_svc_name" {
  type = string
  description = "Name of the contoller"
  default = "nginx-ingress-ingress-nginx-controller"
}

variable "k8s_clustername" {
  type = string
  description = "Name of the Application Clusters"
  default = "k8s"
}

variable "k8s_version" {
  type = string
  description = "Version of the Application Clusters"
  default = "1.24.4-do.0"
}

variable "k8s_poolname" {
  type = string
  description = "Name of the Application Clusters node group"
  default = "worker-pool"
}

variable "k8s_tag" {
  type = list(string)
  description = "Application Cluster tag"
  default = ["k8s"]
}

variable "node_total" {
  type = number
  description = "Number of Nodes in the application"
  default = 3
}

variable "node_size" {
  type = string
  description = "Instance Type or Size - Hardware for the application"
  default = "s-2vcpu-2gb"
}

variable "node_pool_tag" {
  type = list(string)
  description = "Pool tag"
  default = ["node-pool"]
}

variable "project_region" {
  type        = string
  description = "Project resource region"
  default     = "nyc1"
}

variable "cluster_version" {
  type        = string
  description = "MySQL version used in the Cluster."
  default     = "8"
}

variable "cluster_size" {
  type        = string
  description = "Instance Type or Size - Hardware for the MySQL Cluster"
  default     = "db-s-1vcpu-1gb"
}

variable "cluster_engine" {
  type        = string
  description = "SBGD MySQL engine"
  default     = "mysql"
}

variable "cluster_nodes_count" {
  type        = number
  description = "Number of Nodes in the MySQL Cluster"
  default     = 1
}

variable "cluster_name" {
  type        = string
  description = "MySQL Cluster Name"
  default     = "mysql"
}

variable "database" {
  type        = string
  description = "Site Database Name within the Cluster"
  default     = "app-database-com"
}

variable "username" {
  type        = string
  description = "Database Access Username"
  default     = "app-username-com"
}

variable "firewall_name" {
  type        = string
  default     = "firewall_name"
}

variable "vpc_name" {
  type        = string
  default     = "vpc-com"
}
