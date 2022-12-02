<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_health_check.wp-healthcheck](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_health_check) | resource |
| [google_compute_instance_template.wordpress-template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_template) | resource |
| [google_compute_region_autoscaler.wordpress-autoscaler](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_autoscaler) | resource |
| [google_compute_region_instance_group_manager.wordpress-ig](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | n/a | `string` | n/a | yes |
| <a name="input_cooldown-period"></a> [cooldown-period](#input\_cooldown-period) | n/a | `number` | n/a | yes |
| <a name="input_healthy"></a> [healthy](#input\_healthy) | n/a | `number` | n/a | yes |
| <a name="input_ig-zones"></a> [ig-zones](#input\_ig-zones) | n/a | `list(string)` | n/a | yes |
| <a name="input_instance-tags"></a> [instance-tags](#input\_instance-tags) | n/a | `list(string)` | n/a | yes |
| <a name="input_interval"></a> [interval](#input\_interval) | n/a | `number` | n/a | yes |
| <a name="input_machine-type"></a> [machine-type](#input\_machine-type) | n/a | `string` | n/a | yes |
| <a name="input_max-replicas"></a> [max-replicas](#input\_max-replicas) | n/a | `number` | n/a | yes |
| <a name="input_min-replicas"></a> [min-replicas](#input\_min-replicas) | n/a | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_named-port-name"></a> [named-port-name](#input\_named-port-name) | n/a | `string` | n/a | yes |
| <a name="input_named-port-number"></a> [named-port-number](#input\_named-port-number) | n/a | `number` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_service-account-email"></a> [service-account-email](#input\_service-account-email) | n/a | `string` | n/a | yes |
| <a name="input_source-image"></a> [source-image](#input\_source-image) | n/a | `string` | n/a | yes |
| <a name="input_startup-script-path"></a> [startup-script-path](#input\_startup-script-path) | n/a | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | n/a | `string` | n/a | yes |
| <a name="input_target"></a> [target](#input\_target) | n/a | `number` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | n/a | `number` | n/a | yes |
| <a name="input_unhealthy"></a> [unhealthy](#input\_unhealthy) | n/a | `number` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->