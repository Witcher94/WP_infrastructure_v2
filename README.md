<!-- BEGIN_TF_DOCS -->
## About
This is educational task for provisioning wordpress infrastructure on Google Cloud Provider
## Scheme
![](graph.svg)
## Requirements
No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.2.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud-sql"></a> [cloud-sql](#module\_cloud-sql) | ./modules/cloud_sql | n/a |
| <a name="module_cloud-storage"></a> [cloud-storage](#module\_cloud-storage) | ./modules/cloud_storage | n/a |
| <a name="module_firewall"></a> [firewall](#module\_firewall) | ./modules/firewall | n/a |
| <a name="module_instance-group"></a> [instance-group](#module\_instance-group) | ./modules/instance-group | n/a |
| <a name="module_packer"></a> [packer](#module\_packer) | ./modules/packer | n/a |
| <a name="module_secret-manager"></a> [secret-manager](#module\_secret-manager) | ./modules/secret-manager | n/a |
| <a name="module_service-account"></a> [service-account](#module\_service-account) | ./modules/service-account | n/a |
| <a name="module_subnet"></a> [subnet](#module\_subnet) | ./modules/subnets | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.sa-keyfile](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_file"></a> [account\_file](#input\_account\_file) | n/a | `string` | n/a | yes |
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | standard id for service account | `string` | `"wp-service-account"` | no |
| <a name="input_allocate_option"></a> [allocate\_option](#input\_allocate\_option) | nat\_ip\_allocate\_option - How external IPs should be allocated for this NAT. | `string` | `"AUTO_ONLY"` | no |
| <a name="input_auto_create_subnetworks"></a> [auto\_create\_subnetworks](#input\_auto\_create\_subnetworks) | When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources. | `bool` | `false` | no |
| <a name="input_cooldown-period"></a> [cooldown-period](#input\_cooldown-period) | n/a | `number` | `60` | no |
| <a name="input_db-name"></a> [db-name](#input\_db-name) | Database name | `string` | `"wp-database"` | no |
| <a name="input_db-node-name"></a> [db-node-name](#input\_db-node-name) | Name of each node in mssql cluster | `string` | `"wp-node"` | no |
| <a name="input_db-username"></a> [db-username](#input\_db-username) | Database user | `string` | `"wp-user"` | no |
| <a name="input_db-version"></a> [db-version](#input\_db-version) | Version of the mssql can be also MYSQL\_8\_0 or MYSQL\_5\_6 | `string` | `"MYSQL_5_7"` | no |
| <a name="input_delete_default_internet_gateway_routes"></a> [delete\_default\_internet\_gateway\_routes](#input\_delete\_default\_internet\_gateway\_routes) | If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted | `bool` | `false` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | protection for deletetion databases if set True | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | An optional description of this resource. The resource must be recreated to modify this field. Related to VPC module | `string` | `""` | no |
| <a name="input_healthy"></a> [healthy](#input\_healthy) | n/a | `number` | `2` | no |
| <a name="input_ig-tags"></a> [ig-tags](#input\_ig-tags) | n/a | `list(string)` | <pre>[<br>  "wordpress"<br>]</pre> | no |
| <a name="input_image-name"></a> [image-name](#input\_image-name) | Packer image | `string` | n/a | yes |
| <a name="input_instance-machine-type"></a> [instance-machine-type](#input\_instance-machine-type) | instance-group | `string` | `"e2-micro"` | no |
| <a name="input_interval"></a> [interval](#input\_interval) | n/a | `number` | `20` | no |
| <a name="input_ip_ranges_to_nat"></a> [ip\_ranges\_to\_nat](#input\_ip\_ranges\_to\_nat) | source\_subnetwork\_ip\_ranges\_to\_nat - How NAT should be configured per Subnetwork | `string` | `"ALL_SUBNETWORKS_ALL_IP_RANGES"` | no |
| <a name="input_ipv4_enabled"></a> [ipv4\_enabled](#input\_ipv4\_enabled) | If needed external IP set to True | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Defined labels for the secret | `string` | `"first_secret"` | no |
| <a name="input_length"></a> [length](#input\_length) | The secret length | `number` | `10` | no |
| <a name="input_max-replicas"></a> [max-replicas](#input\_max-replicas) | n/a | `number` | `3` | no |
| <a name="input_members"></a> [members](#input\_members) | Who will achieve the roles | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_min-replicas"></a> [min-replicas](#input\_min-replicas) | n/a | `number` | `1` | no |
| <a name="input_min_lower"></a> [min\_lower](#input\_min\_lower) | min number of lower literals | `number` | `2` | no |
| <a name="input_min_numeric"></a> [min\_numeric](#input\_min\_numeric) | min number of numbers in secret | `number` | `2` | no |
| <a name="input_min_special"></a> [min\_special](#input\_min\_special) | min number of special symbols in secret | `number` | `2` | no |
| <a name="input_min_upper"></a> [min\_upper](#input\_min\_upper) | Min number of upper literals | `number` | `2` | no |
| <a name="input_mtu"></a> [mtu](#input\_mtu) | The network MTU (If set to 0, meaning MTU is unset - defaults to '1460'). | `number` | `0` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for all of the services | `string` | `"wordpress"` | no |
| <a name="input_nat_name"></a> [nat\_name](#input\_nat\_name) | Nat default name | `string` | `"wp-nat"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | VPC name related to VPC module | `string` | `"wp-network"` | no |
| <a name="input_packer-machine-type"></a> [packer-machine-type](#input\_packer-machine-type) | n/a | `string` | n/a | yes |
| <a name="input_playbook"></a> [playbook](#input\_playbook) | n/a | `string` | n/a | yes |
| <a name="input_port-name"></a> [port-name](#input\_port-name) | n/a | `string` | `"http"` | no |
| <a name="input_port-number"></a> [port-number](#input\_port-number) | n/a | `number` | `80` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | defined roles | `set(string)` | <pre>[<br>  "roles/iap.tunnelResourceAccessor",<br>  "roles/compute.instanceAdmin.v1",<br>  "roles/iam.serviceAccountUser",<br>  "roles/storage.admin"<br>]</pre> | no |
| <a name="input_router_name"></a> [router\_name](#input\_router\_name) | Router default name | `string` | `"wp-router"` | no |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | The network routing mode (default 'GLOBAL'), Related to VPC module | `string` | `"GLOBAL"` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | Coma separated map, to add new rule copy an example above | `map` | <pre>{<br>  "rule": {<br>    "allow": [<br>      {<br>        "ports": [<br>          "22"<br>        ],<br>        "protocol": "tcp"<br>      }<br>    ],<br>    "deny": [],<br>    "description": null,<br>    "direction": "INGRESS",<br>    "name": "allow-ssh-engress",<br>    "priority": 1000,<br>    "ranges": [<br>      "0.0.0.0/0"<br>    ],<br>    "source_service_accounts": null,<br>    "source_tags": null,<br>    "target_service_accounts": null,<br>    "target_tags": null<br>  }<br>}</pre> | no |
| <a name="input_secret_id"></a> [secret\_id](#input\_secret\_id) | id of the secret | `string` | `"wp-secret"` | no |
| <a name="input_source-image"></a> [source-image](#input\_source-image) | n/a | `string` | n/a | yes |
| <a name="input_startup-path"></a> [startup-path](#input\_startup-path) | n/a | `string` | `"./modules/instance-group/gcloud-startup-script.sh"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Input Variables for subnet module | `map` | <pre>{<br>  "private": {<br>    "ip": "10.10.10.0/24",<br>    "name": "private",<br>    "region": "europe-west3"<br>  },<br>  "public": {<br>    "ip": "10.10.20.0/24",<br>    "name": "public",<br>    "region": "europe-west3",<br>    "subnet_flow_logs": "true",<br>    "subnet_flow_logs_filter_expr": "true",<br>    "subnet_flow_logs_interval": "INTERVAL_10_MIN",<br>    "subnet_flow_logs_metadata": "INCLUDE_ALL_METADATA",<br>    "subnet_flow_logs_sampling": 0.7<br>  }<br>}</pre> | no |
| <a name="input_target"></a> [target](#input\_target) | n/a | `number` | `0.9` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Standard DB machine tier | `string` | `"db-f1-micro"` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | n/a | `number` | `5` | no |
| <a name="input_unhealthy"></a> [unhealthy](#input\_unhealthy) | n/a | `number` | `5` | no |
