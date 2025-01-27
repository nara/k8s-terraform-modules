module "prometheus_crds" {
  count = var.install_prometheus ? 1 : 0
  source = "../../helm_release"
  release_name       = var.prometheus_crd_release_name
  chart_name      = var.prometheus_crd_chart_name
  chart_repository = var.prometheus_repository
  chart_version    = var.prometheus_crd_chart_version
  chart_namespace  = "default"

  max_history = var.max_history

  values_files_path_list = [for path in [var.prometheus_crd_values_file_path] : path if path != ""]
}

module "ops_cluster_mon_helm_release" {
  count = var.install_thanos && var.install_grafana ? 1 : 0
  source = "../../helm_release"
  release_name       = "ops-cluster-monitoring-helm-release"
  chart_name      = "${path.module}/../../helm_charts/ops_cluster_monitoring"
  chart_repository = ""
  chart_version    = "1.0.4"
  chart_namespace  = var.monitoring_namespace

  max_history = var.max_history

  values_files_path_list = [for path in [var.kube_prometheus_stack_values_file_path] : path if path != ""]
}

module "kube_prometheus_stack_release" {
  count = var.install_prometheus ? 1 : 0
  source = "../../helm_release"
  release_name       = var.kube_prometheus_stack_release_name
  chart_name      = var.kube_prometheus_stack_chart_name
  chart_repository = var.prometheus_repository
  chart_version    = var.kube_prometheus_stack_chart_version
  chart_namespace  = var.monitoring_namespace

  max_history = var.max_history

  values_files_path_list = [for path in [var.kube_prometheus_stack_values_file_path] : path if path != ""]
  depends_on = [module.prometheus_crds, module.ops_cluster_mon_helm_release]
}

module "thanos_release" {
  count = var.install_thanos ? 1 : 0
  source = "../../helm_release"
  release_name       = var.thanos_release_name
  chart_name      = var.thanos_chart_name
  chart_repository = var.thanos_repository
  chart_version    = var.thanos_chart_version
  chart_namespace  = var.monitoring_namespace

  max_history = var.max_history

  values_files_path_list = [for path in [var.thanos_values_file_path] : path if path != ""]
  depends_on = [module.kube_prometheus_stack_release]
}

module "grafana_release" {
  count = var.install_grafana ? 1 : 0
  source = "../../helm_release"
  release_name       = var.grafana_release_name
  chart_name      = var.grafana_chart_name
  chart_repository = var.grafana_repository
  chart_version    = var.grafana_chart_version
  chart_namespace  = var.monitoring_namespace

  max_history = var.max_history

  values_files_path_list = [for path in [var.grafana_values_file_path] : path if path != ""]
  depends_on = [module.thanos_release]
}