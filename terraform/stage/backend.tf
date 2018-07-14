terraform {
  backend "gcs" {
    bucket = "otus-tf-backend"
    prefix = "terraform/tfstate/stage"
  }
}
