resource "kubernetes_namespace" "namespace" {
  metadata {
    name        = var.namespace_name
    labels      = var.labels
    annotations = var.annotations
  }
}

resource "kubernetes_role" "admin_role" {
  metadata {
    name      = "${var.namespace_name}-admin-role"
    namespace = var.namespace_name
  }
  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["*"]
  }
}

resource "kubernetes_role_binding" "admin_role_binding" {
  metadata {
    name      = "${var.namespace_name}-admin-role-binding"
    namespace = var.namespace_name
  }
  role_ref {
    kind     = "Role"
    name     = kubernetes_role.admin_role.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "Group"
    name      = var.admin_ad_group_id
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_role" "reader_role" {
  metadata {
    name      = "${var.namespace_name}-reader-role"
    namespace = var.namespace_name
  }
  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_role_binding" "reader_role_binding" {
  metadata {
    name      = "${var.namespace_name}-reader-role-binding"
    namespace = var.namespace_name
  }
  role_ref {
    kind     = "Role"
    name     = kubernetes_role.reader_role.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "Group"
    name      = var.reader_ad_group_id
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_role" "sre_role" {
  metadata {
    name      = "${var.namespace_name}-sre-role"
    namespace = var.namespace_name
  }
  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }
}

resource "kubernetes_role_binding" "sre_role_binding" {
  metadata {
    name      = "${var.namespace_name}-sre-role-binding"
    namespace = var.namespace_name
  }
  role_ref {
    kind     = "Role"
    name     = kubernetes_role.sre_role.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "Group"
    name      = var.sre_ad_group_id
    api_group = "rbac.authorization.k8s.io"
  }
}