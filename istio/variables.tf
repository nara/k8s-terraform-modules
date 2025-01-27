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
variable "istio_base_helm_release" {
  type = object({
    release_name       = string
    chart_name         = string
    chart_repository   = string
    chart_version      = string
    chart_namespace    = string
    values_files_path_list = list(string)
  })
  description = "Helm release for istio base"
  default     = {
    release_name       = "istio-base"
    chart_name         = "base"
    chart_repository   = "https://istio-release.storage.googleapis.com/charts"
    chart_version      = ""
    chart_namespace    = "istio-system"
    values_files_path_list = []
  }
}

variable "istiod_helm_release" {
  type = object({
    release_name       = string
    chart_name         = string
    chart_repository   = string
    chart_version      = string
    chart_namespace    = string
    values_files_path_list = list(string)
  })
  description = "Helm release for istiod"
  default     = {
    release_name       = "istiod"
    chart_name         = "istiod"
    chart_repository   = "https://istio-release.storage.googleapis.com/charts"
    chart_version      = ""
    chart_namespace    = "istio-system"
    values_files_path_list = []
  }
}

variable "istio_ingress_helm_release" {
  type = object({
    enable_ingress     = bool
    release_name       = string
    chart_name         = string
    chart_repository   = string
    chart_version      = string
    chart_namespace    = string
    values_files_path_list = list(string)
  })
  description = "Helm release for istio ingress"
  default     = {
    enable_ingress     = false
    release_name       = "istio-ingress"
    chart_name         = "gateway"
    chart_repository   = "https://istio-release.storage.googleapis.com/charts"
    chart_version      = ""
    chart_namespace    = "istio-system"
    values_files_path_list = []
  }
}

variable "ops_cluster_istio_helm_release" {
  type = object({
    release_name       = string
    chart_version      = string
    chart_namespace    = string
    values_files_path_list = list(string)
  })
  description = "Helm release for istio ingress"
  default     = {
    release_name       = "ops-cluster-istio-helm-release"
    chart_name         = "gateway"
    chart_repository   = "https://istio-release.storage.googleapis.com/charts"
    chart_version      = "1.0.4"
    chart_namespace    = "istio-system"
    values_files_path_list = []
  }
}

variable "traffic_management_rules"{
  description = "Traffic management rules"
  type        = list(object({
    source_namespace = string
    source_service = optional(string)
    destination_namespace = string
    destination_service = optional(string)
    action = string
  }))
  default     = []
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