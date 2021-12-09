
resource "kubernetes_deployment" "java" {
  metadata {
    name = "lartey-microservice-deployment"
    labels = {
      app  = "lartey-microservice"
    }
  }
spec {
    replicas = 2
selector {
      match_labels = {
        app  = "lartey-microservice"
      }
    }
template {
      metadata {
        labels = {
          app  = "lartey-microservice"
        }
      }
spec {
        container {
          image = "603825719481.dkr.ecr.eu-west-3.amazonaws.com/gl-blog"
          name  = "lartey-microservice-container"
          port {
            container_port = 8000
         }
        }
      }
    }
  }
}
resource "kubernetes_service" "java" {
  depends_on = [kubernetes_deployment.java]
  metadata {
    name = "lartey-microservice-service"
  }
  spec {
    selector = {
      app = "lartey-microservice"
    }
    port {
      port        = 80
      target_port = 8000
    }
type = "LoadBalancer"
}
}