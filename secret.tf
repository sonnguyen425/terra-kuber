resource "kubernetes_secret" "secret-namespace2" {
  metadata {
    name = "docker-cfg"
    namespace = "terraform-test-namespace-2"
  }

  data {
    ".dockercfg" = "${file("/home/son.nguyen/.docker/config.json")}"
  }

  type = "kubernetes.io/dockercfg"
}
