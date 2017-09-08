resource "kubernetes_limit_range" "range1" {
    metadata {
        name = "range1"
        namespace = "terraform-test-namespace-2"
    }
    spec {
        limit {
            type = "Pod"
            max {
                cpu = "200m"
                memory = "1024M"
            }
        }
        limit {
            type = "PersistentVolumeClaim"
            min {
                storage = "24M"
            }
        }
        limit {
            type = "Container"
            default {
                cpu = "50m"
                memory = "64M"
            }
        }
    }
}
