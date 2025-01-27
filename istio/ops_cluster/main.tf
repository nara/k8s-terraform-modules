module "istio_base_helm_release" {
  source = "../../helm_release"
  release_name = var.istio_base_helm_release.release_name
  chart_name = var.istio_base_helm_release.chart_name
  chart_repository = var.istio_base_helm_release.chart_repository
  chart_version = var.istio_base_helm_release.chart_version
  chart_namespace = var.istio_base_helm_release.chart_namespace
  values_files_path_list = var.istio_base_helm_release.values_files_path_list
}

module "istiod_helm_release" {
  source = "../../helm_release"
  release_name = var.istiod_helm_release.release_name
  chart_name = var.istiod_helm_release.chart_name
  chart_repository = var.istiod_helm_release.chart_repository
  chart_version = var.istiod_helm_release.chart_version
  chart_namespace = var.istiod_helm_release.chart_namespace
  values_files_path_list = var.istiod_helm_release.values_files_path_list
  depends_on = [module.istio_base_helm_release]
}

module "istio_ingress_helm_release" {
  count = var.istio_ingress_helm_release.enable_ingress ? 1 : 0
  source = "../../helm_release"
  release_name = var.istio_ingress_helm_release.release_name
  chart_name = var.istio_ingress_helm_release.chart_name
  chart_repository = var.istio_ingress_helm_release.chart_repository
  chart_version = var.istio_ingress_helm_release.chart_version
  chart_namespace = var.istio_ingress_helm_release.chart_namespace
  values_files_path_list = var.istio_ingress_helm_release.values_files_path_list
  depends_on = [module.istiod_helm_release]
}

module "ops_cluster_istio_helm_release" {
  source = "../../helm_release"
  release_name       = "ops-cluster-istio-helm-release"
  chart_name      = "${path.module}/../../helm_charts/istio_traffic_mgmt"
  chart_repository = ""
  chart_version    = var.ops_cluster_istio_helm_release.chart_version
  chart_namespace  = var.ops_cluster_istio_helm_release.chart_namespace
  values_files_path_list = var.ops_cluster_istio_helm_release.values_files_path_list
}