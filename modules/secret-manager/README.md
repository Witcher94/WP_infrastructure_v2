<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_secret_manager_secret.wp-db-secret](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_version.wp-db-secret](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_labels"></a> [labels](#input\_labels) | n/a | `string` | n/a | yes |
| <a name="input_length"></a> [length](#input\_length) | n/a | `number` | n/a | yes |
| <a name="input_min_lower"></a> [min\_lower](#input\_min\_lower) | n/a | `number` | n/a | yes |
| <a name="input_min_numeric"></a> [min\_numeric](#input\_min\_numeric) | n/a | `number` | n/a | yes |
| <a name="input_min_special"></a> [min\_special](#input\_min\_special) | n/a | `number` | n/a | yes |
| <a name="input_min_upper"></a> [min\_upper](#input\_min\_upper) | n/a | `number` | n/a | yes |
| <a name="input_secret_id"></a> [secret\_id](#input\_secret\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret"></a> [secret](#output\_secret) | n/a |
<!-- END_TF_DOCS -->