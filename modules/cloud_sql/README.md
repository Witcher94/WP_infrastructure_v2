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
| [google_compute_global_address.private-ip-address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_service_networking_connection.master-private-vpc-db-connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |
| [google_service_networking_connection.replica-private-vpc-db-connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |
| [google_sql_database.database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.wordpress-db](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_database_instance.wordpress-db-replica](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.users](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [random_id.bucket_prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db-name"></a> [db-name](#input\_db-name) | n/a | `string` | n/a | yes |
| <a name="input_db-node-name"></a> [db-node-name](#input\_db-node-name) | n/a | `string` | n/a | yes |
| <a name="input_db-password"></a> [db-password](#input\_db-password) | n/a | `any` | n/a | yes |
| <a name="input_db-username"></a> [db-username](#input\_db-username) | n/a | `string` | n/a | yes |
| <a name="input_db-version"></a> [db-version](#input\_db-version) | n/a | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | n/a | `bool` | `true` | no |
| <a name="input_ipv4_enabled"></a> [ipv4\_enabled](#input\_ipv4\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | n/a | `string` | n/a | yes |
| <a name="input_vpc-network"></a> [vpc-network](#input\_vpc-network) | VPC-Network output | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db-ip"></a> [db-ip](#output\_db-ip) | n/a |
| <a name="output_prefix"></a> [prefix](#output\_prefix) | n/a |
<!-- END_TF_DOCS -->