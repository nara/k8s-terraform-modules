variable "cluster_name_prefix" {
  description = "The prefix to use for the cluster name."
  type        = string
}

variable "admin_ad_group_id" {
  description = "The object id of the admin group."
  type        = string
}

variable "reader_ad_group_id" {
  description = "The object id of the reader group."
  type        = string
}

variable "sre_ad_group_id" {
  description = "The object id of the sre group."
  type        = string
}