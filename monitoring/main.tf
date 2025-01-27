module "ops_cluster" {
  count = var.is_ops_cluster ? 1 : 0
  source = "./ops_cluster"
  kube_prometheus_stack_chart_name = var.kube_prometheus_stack_chart_name
  kube_prometheus_stack_chart_version = var.kube_prometheus_stack_chart_version
  kube_prometheus_stack_release_name = var.kube_prometheus_stack_release_name
  kube_prometheus_stack_values_file_path = var.kube_prometheus_stack_values_file_path
  max_history = var.max_history
  monitoring_namespace = var.monitoring_namespace
  prometheus_crd_chart_name = var.prometheus_crd_chart_name
  prometheus_crd_chart_version = var.prometheus_crd_chart_version
  prometheus_crd_release_name = var.prometheus_crd_release_name
  prometheus_crd_values_file_path = var.prometheus_crd_values_file_path
  prometheus_repository = var.prometheus_repository
  thanos_chart_name = var.thanos_chart_name
  thanos_chart_version = var.thanos_chart_version
  thanos_release_name = var.thanos_release_name
  thanos_repository = var.thanos_repository
  thanos_values_file_path = var.thanos_values_file_path
  grafana_chart_name = var.grafana_chart_name
  grafana_chart_version = var.grafana_chart_version
  grafana_release_name = var.grafana_release_name
  grafana_repository = var.grafana_repository
  grafana_values_file_path = var.grafana_values_file_path
  ops_cluster_values_file_path = var.ops_cluster_values_file_path
  install_prometheus = var.install_prometheus
  install_grafana = var.install_grafana
  install_thanos = var.install_thanos
  install_argocd = var.install_argocd
}

module "workload_cluster" {
  count = var.is_ops_cluster ? 0 : 1
  source = "./workload_cluster"
}