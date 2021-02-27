variable "region" {
  description = "Where the resources will be created"
  type        = string 
}

variable "environment" {
  description = "Describe the environment that will be used to deploy a resource"
  type        = string
}

variable "owner-resource" {
  description = "Who the resource belongs to (e.g a Group or a person)"
  type        = string
}

variable "repository_name" {
  type        = string
  description = "Name of the repository"
}

variable "attach_lifecycle_policy" {
  default     = false
  type        = bool
  description = "If true, an ECR lifecycle policy will be attached"
}

variable "lifecycle_policy" {
  default     = ""
  type        = string
  description = "Contents of the ECR lifecycle policy"
}