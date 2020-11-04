variable "name" {
  type        = string
  description = "Name of load balancer and ACL"
}

variable "network_id" {
  type        = string
  description = "VPC network ID"
}

variable "services" {
  type = map(object({
    allowed_cidrs = list(string)
    member_ids    = list(string)
    protocol      = string
    public_port   = string
    private_port  = string
  }))
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}
