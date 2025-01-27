resource "kubernetes_namespace" "namespace" {
  metadata {
    name        = var.argocd_helm_release.chart_namespace
  }
}

module "argocd_helm_release" {
  source = "../helm_release"
  release_name = var.argocd_helm_release.release_name
  chart_name = var.argocd_helm_release.chart_name
  chart_repository = var.argocd_helm_release.chart_repository
  chart_version = var.argocd_helm_release.chart_version
  chart_namespace = var.argocd_helm_release.chart_namespace
  values_files_path_list = var.argocd_helm_release.values_files_path_list
}

# resource "argocd_project" "argocd_project" {
#   for_each = { for item in var.namespaces : item.namespace => item }
#   metadata {
#     name      = "${each.value.namespace}-argo-project" #project name used in role definitions
#     namespace = each.key
#     labels = {
#       acceptance = "true"
#     }
#   }
#   spec {
#     description = "simple project"

#     source_namespaces = [each.key]
#     source_repos      = ["*"]

#     destination {
#       server    = "https://kubernetes.default.svc"
#       namespace = each.key
#     }
#   }
#   depends_on = [module.argocd_helm_release]
# }

# module "argocd_apps_helm_release" {
#   source = "../helm_release"
#   release_name = var.argocd_apps_helm_release.release_name
#   chart_name = var.argocd_apps_helm_release.chart_name
#   chart_repository = var.argocd_apps_helm_release.chart_repository
#   chart_version = var.argocd_apps_helm_release.chart_version
#   chart_namespace = var.argocd_apps_helm_release.chart_namespace
#   values_files_path_list = var.argocd_apps_helm_release.values_files_path_list
# }