provider "aws" {
  region = var.region
}

# get EKS authentication for being able to manage k8s objects from terraform
provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}


# resource "kubernetes_namespace" "namespace" {
#   metadata {
#     annotations = {
#       name = "namespace"
#     }

#     labels = {
#       istio-injection = "enabled"
#     }

#     name = "namespace"
#   }
# }


# terraform {
#   required_providers {
#     aws = {
#         source  = "hashicorp/aws"
#         version = ">= 3.20.0"
#     }
#   }
# }