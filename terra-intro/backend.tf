terraform {
  backend "s3" {
    bucket     = "oo-s3-backend-udemy-course"
    key        = "terraform/tfstate.tfstate"
    access_key = "AKIAUQQVQNBJUXBOQQSR"
    secret_key = "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"
    region     = "eu-west-2"
  }
}
