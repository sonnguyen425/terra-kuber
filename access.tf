resource "kubernetes_service" "access" {
  metadata {
    name = "terraform-service-access"
    namespace = "terraform-test-namespace-2"
  }
  spec {
    selector {
      app = "${kubernetes_pod.test_access.metadata.0.labels.app}"
    }
    session_affinity = "ClientIP"
    port {
      port = 3100
      target_port = 31001
    }
    type = "LoadBalancer"
  }
}

resource "kubernetes_pod" "test_access" {
  metadata {
    name = "access"
    namespace = "terraform-test-namespace-2"
    labels {
      app = "access"
    }
  }
  spec {
    container {
      image = "hub01.rcapp.io:5001/access:v2-12e9772"
      name  = "access"
      env {
        name = "PROJECT_NAME"
        value = "access"

        name = "MODULE_NAME"
        value = "access"

        name = "CONSUL_SERVER"
        value = "192.168.10.42:8500"

        name = "DATA_CENTER"
        value = "daily"

        name = "PROJECT_DIR"
        value = "/srv/tokyo/access/current"

        name = "LOG_MODE"
        value = "INFO"
      }
    }
  }
}
