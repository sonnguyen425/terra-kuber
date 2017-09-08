resource "kubernetes_namespace" "test" {
  metadata {
    annotations {
      name = "test-annotation"
    }

    labels {
      version = "v2"
    }

    name = "terraform-test-namespace-2"
  }
}

