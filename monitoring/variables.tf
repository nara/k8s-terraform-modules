variable "prometheus_chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  type        = string
  default     = "59.1.0"
}

#general
variable "monitoring_namespace" {
  description = "Namespace to install the monitoring stack into"
  default     = "monitoring"
}

variable "max_history" {
  description = "Max History for Helm"
  default     = 20
}

#ops cluster helm
variable "ops_cluster_values_file_path" {
  description = "Path to the values file for ops_cluster"
  default     = ""
}

#kube stack
variable "kube_prometheus_stack_release_name" {
  description = "Name of the kube prometheus stack release"
  default     = "kube-prometheus-stack"
}

variable "kube_prometheus_stack_chart_name" {
  description = "Name of the kube prometheus stack release"
  default     = "kube-prometheus-stack"
}

variable "prometheus_repository" {
  description = "Helm repository for the chart"
  default     = "https://prometheus-community.github.io/helm-charts"
}

variable "kube_prometheus_stack_values_file_path" {
  description = "Path to the values file for kube-prometheus-stack"
  default     = ""
}

variable "kube_prometheus_stack_chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  default     = ""
}

#prom CRDs
variable "prometheus_crd_release_name" {
  description = "Name of the kube prometheus stack release"
  default     = "prometheus-operator-crds"
}

variable "prometheus_crd_chart_name" {
  description = "Name of the kube prometheus stack release"
  default     = "prometheus-operator-crds"
}

variable "prometheus_crd_values_file_path" {
  description = "Path to the values file for prometheus-operator-crds"
  default     = ""
}

variable "prometheus_crd_chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  default     = ""
}

#thanos
variable "thanos_release_name" {
  description = "Name of thanos release"
  default     = "thanos"
}

variable "thanos_chart_name" {
  description = "Name of thanos chart name"
  default     = "thanos"
}

variable "thanos_repository" {
  description = "Helm repository for the thanos chart"
  default     = "oci://registry-1.docker.io/bitnamicharts"
}

variable "thanos_values_file_path" {
  description = "Path to the values file for thanos"
  default     = ""
}

variable "thanos_chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  default     = "15.6.0"
}

#grafana
variable "grafana_release_name" {
  description = "Name of grafana release"
  default     = "grafana"
}

variable "grafana_chart_name" {
  description = "Name of grafana chart name"
  default     = "grafana"
}

variable "grafana_repository" {
  description = "Helm repository for the grafana chart"
  default     = "https://grafana.github.io/helm-charts"
}

variable "grafana_values_file_path" {
  description = "Path to the values file for grafana"
  default     = ""
}

variable "grafana_chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  default     = ""
}

variable "is_ops_cluster" {
  description = "Is this an operations cluster?"
  type        = bool
  default     = true
}

variable "install_istio" {
  description = "Install Istio"
  type        = bool
  default     = false
}

variable "install_prometheus" {
  description = "Install Prometheus"
  type        = bool
  default     = false
}

variable "install_grafana" {
  description = "Install Grafana"
  type        = bool
  default     = false
}

variable "install_argocd" {
  description = "Install ArgoCD"
  type        = bool
  default     = false
}

variable "install_thanos" {
  description = "Install Thanos"
  type        = bool
  default     = false
}
