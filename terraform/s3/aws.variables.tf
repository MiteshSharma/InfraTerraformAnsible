variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-2"
}
variable "bucket_names" {
  description = "Bucket name to create on s3"
  type = "list"
  default = []
}
variable "environment_tag" {
  description = "Environment tag"
  default = ""
}
variable "name_tag" {
  description = "Name tag"
  default = ""
}