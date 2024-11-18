variable "name" {
  description = "Name of the Multipass instance"
  type        = string
}

variable "cpus" {
  description = "Number of CPUs"
  type        = number
  default     = 1
}

variable "image" {
  description = "Image for the Multipass instance"
  type        = string
  default     = "jammy"
}
