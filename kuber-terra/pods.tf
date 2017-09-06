resource "kubernetes_pod" "test_access" {
  metadata {
    name = "access"
    namespace = "terraform-test-namespace-2"
  }

  spec {
    container {
      image = "hub01.rcapp.io:5001/access:v2-12e9772 "
      name  = "access"
      env {
        name = "PROJECT_NAME"
        value = "access"
      }
      env {
        name = "MODULE_NAME"
        value = "access"
      }
      env {
        name = "CONSUL_SERVER"
        value = "192.168.10.42:8500"
      }
      env {
        name = "DATA_CENTER"
        value = "daily"
      }
      env {
        name = "PROJECT_DIR"
        value = "/srv/tokyo/access/current"
      }
      env {
        name = "LOG_MODE"
        value = "INFO"
      }
    }
  }
}

resource "kubernetes_pod" "test-adminapi" {
  metadata {
    name = "admin-api"
    namespace = "terraform-test-namespace-2"
  }

  spec {
    container {
      image = "hub01.rcapp.io:5001/admin-api:v8-060ba2b  "
      name  = "admin-api"
      env {
        name = "PROJECT_NAME"
        value = "admin-api"
      }
      env {
        name = "MODULE_NAME"
        value = "admin-api"
      }
      env {
        name = "CONSUL_SERVER"
        value = "192.168.10.42:8500"
      }
      env {
        name = "DATA_CENTER"
        value = "daily"
      }
      env {
        name = "PROJECT_DIR"
        value = "/srv/tokyo/admin-api/current"
      }
      env {
        name = "LOG_MODE"
        value = "INFO"
      }
    }
  }
}

