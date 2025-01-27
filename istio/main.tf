resource "kubernetes_namespace" "namespace" {
  metadata {
    name        = var.istio_base_helm_release.chart_namespace
  }
}

module "istio_ops_cluster" {
  count = var.is_ops_cluster ? 1 : 0
  source = "./ops_cluster"
  istio_base_helm_release = var.istio_base_helm_release
  istiod_helm_release = var.istiod_helm_release
  istio_ingress_helm_release = var.istio_ingress_helm_release
  depends_on = [kubernetes_namespace.namespace]
}
