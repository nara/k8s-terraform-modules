variable "is_ops_cluster"{
  description = "Is this an ops cluster"
  type        = bool
  default     = false
}

variable "max_history" {
  description = "Max History for Helm"
  default     = 20
}

#ops cluster helm
variable "argocd_helm_release" {
  type = object({
    release_name       = string
    chart_name         = string
    chart_repository   = string
    chart_version      = string
    chart_namespace    = string
    values_files_path_list = list(string)
  })
  description = "Helm release for argocd"
  default     = {
    release_name       = "argocd"
    chart_name         = "argo-cd"
    chart_repository   = "https://argoproj.github.io/argo-helm"
    chart_version      = ""
    chart_namespace    = "argocd"
    values_files_path_list = []
  }
}

variable "argocd_apps_helm_release" {
  type = object({
    release_name       = string
    chart_name         = string
    chart_repository   = string
    chart_version      = string
    chart_namespace    = string
    values_files_path_list = list(string)
  })
  description = "Helm release for argocd"
  default     = {
    release_name       = "argocd-apps"
    chart_name         = "argocd-apps"
    chart_repository   = "https://argoproj.github.io/argo-helm"
    chart_version      = ""
    chart_namespace    = "argocd-apps"
    values_files_path_list = []
  }
}

variable "namespaces" {
  description = "List of namespaces and services to be created in each of the namespace."
  type        = list(object({
    namespace = string
    namespace_key = string
    services = list(string)
  }))
  default     = []
}