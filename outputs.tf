output "acl_id" {
  description = "ACL ID"
  value       = cosmic_network_acl.default.id
}

output "ip_address" {
  description = "IP address"
  value       = cosmic_ipaddress.default.ip_address
}
