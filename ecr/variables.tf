variable "project" {
  type = string
  default = "raghav-test"
  description = "Overall Project Name"
}

variable "subnet_id_1" {
  default = "subnet-16704f71"
}
variable "subnet_id_2" {
  default = "subnet-68c0fa46"
}

variable "instance_type" {
  default = "t3.medium"
}