variable "prefix" {
  description = "SSM parameter path prefix without leading slash (e.g. agenticcreed/dev)."
  type        = string
}

variable "parameters" {
  description = "Parameter keys to create at /{prefix}/{key}. Set values manually in AWS Console."
  type = map(object({
    secure      = optional(bool, false)
    description = optional(string, "")
  }))
  default = {}
}

variable "placeholder_value" {
  description = "Initial placeholder written on create; ignored on later applies after Console updates."
  type        = string
  default     = "REPLACE_IN_AWS_CONSOLE"
}

variable "tags" {
  description = "Tags applied to all SSM parameters."
  type        = map(string)
  default     = {}
}
