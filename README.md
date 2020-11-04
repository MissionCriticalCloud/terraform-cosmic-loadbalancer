# terraform-cosmic-loadbalancer

Terraform module to create and manage a Cosmic load balancer.

## Example

```hcl
module "loadbalancer" {
  source     = "MissionCriticalCloud/loadbalancer/cosmic"
  name       = "MyApp"
  network_id = "4976b9bd-ba53..."
  vpc_id     = "bcd11371-5cd9..."

  services = {
    http = {
      allowed_cidrs = ["1.2.3.4/32"]
      member_ids    = cosmic_instance.default.*.id
      private_port  = 80
      public_port   = 80
      protocol      = "tcp"
    }

    https = {
      allowed_cidrs = ["1.2.3.4/32"]
      member_ids    = cosmic_instance.default.*.id
      private_port  = 443
      public_port   = 443
      protocol      = "tcp"
    }
  }
}
```

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| cosmic | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of load balancer and ACL | `string` | n/a | yes |
| network\_id | VPC network ID | `string` | n/a | yes |
| services | n/a | <pre>map(object({<br>    allowed_cidrs = list(string)<br>    member_ids    = list(string)<br>    protocol      = string<br>    public_port   = string<br>    private_port  = string<br>  }))</pre> | n/a | yes |
| vpc\_id | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ip\_address | IP address |

<!--- END_TF_DOCS --->
