resource "kubernetes_cluster_role" "admin_cluster_role" {
  metadata {
    name = format("%s-%s", var.cluster_name_prefix,  "admin")
  }
  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["*"]
  }
}

resource "kubernetes_cluster_role_binding" "admin_role_binding" {
  metadata {
    name = format("%s-%s", var.cluster_name_prefix,  "admin-binding")
  }
  role_ref {
    kind     = "ClusterRole"
    name     = kubernetes_cluster_role.admin_cluster_role.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "Group"
    name      = var.admin_ad_group_id
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_cluster_role" "reader_cluster_role" {
  metadata {
    name = format("%s-%s", var.cluster_name_prefix,  "reader")
  }
  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_cluster_role_binding" "reader_role_binding" {
  metadata {
    name = format("%s-%s", var.cluster_name_prefix,  "reader-binding")
  }
  role_ref {
    kind     = "ClusterRole"
    name     = kubernetes_cluster_role.reader_cluster_role.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "Group"
    name      = var.reader_ad_group_id
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_cluster_role" "sre_cluster_role" {
  metadata {
    name = format("%s-%s", var.cluster_name_prefix,  "sre")
  }
  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }
}

resource "kubernetes_cluster_role_binding" "sre_role_binding" {
  metadata {
    name = format("%s-%s", var.cluster_name_prefix,  "sre-binding")
  }
  role_ref {
    kind     = "ClusterRole"
    name     = kubernetes_cluster_role.sre_cluster_role.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "Group"
    name      = var.sre_ad_group_id
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_cluster_role" "automation_cluster_role" {
  metadata {
    name = format("%s-%s", var.cluster_name_prefix,  "auto")
  }
  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }
}

resource "kubernetes_cluster_role_binding" "automation_role_binding" {
  metadata {
    name = format("%s-%s", var.cluster_name_prefix,  "auto-binding")
  }
  role_ref {
    kind     = "ClusterRole"
    name     = kubernetes_cluster_role.automation_cluster_role.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "automation"
    namespace = "default"
  }
}
