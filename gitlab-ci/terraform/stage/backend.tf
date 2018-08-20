terraform {
  backend "gcs" {
    bucket = "otus-tf-backend_gitlab-runner"
    prefix = "terraform/tfstate/stage"
  }
}
