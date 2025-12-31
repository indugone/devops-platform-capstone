terraform {
  backend "s3" {
    bucket       = "my-terraform-state"
    key          = "dev/terraform.tfstate"
    region       = "ap-northeast-1"
    encrypt      = true
    use_lockfile = true
  }
}
