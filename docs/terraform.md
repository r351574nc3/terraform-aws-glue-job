<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.74.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.74.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudwatch_log_group"></a> [cloudwatch\_log\_group](#module\_cloudwatch\_log\_group) | cloudposse/cloudwatch-logs/aws | 0.6.2 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_glue_job.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_auto_scaling_enabled"></a> [auto\_scaling\_enabled](#input\_auto\_scaling\_enabled) | Should autoscaling arguments be passed to glue jobs at execution time? | `bool` | `false` | no |
| <a name="input_cloudwatch_logs_retention_in_days"></a> [cloudwatch\_logs\_retention\_in\_days](#input\_cloudwatch\_logs\_retention\_in\_days) | Number of days you want to retain log events in the log group.<br><br>Must be one of: [0 1 3 5 7 14 30 60 90 120 150 180 365 400 545 731 1827 3653]<br><br>Ignored if `var.cloudwatch_logs_enabled` is set to `false`. | `string` | `"90"` | no |
| <a name="input_connections"></a> [connections](#input\_connections) | The list of connections used for this job. | `list(string)` | `[]` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_default_arguments"></a> [default\_arguments](#input\_default\_arguments) | default arguments for the job | `map(string)` | `{}` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_extra_files"></a> [extra\_files](#input\_extra\_files) | Libraries/wheel dependencies added to the glue job at run time. | `list(string)` | `[]` | no |
| <a name="input_extra_py_files"></a> [extra\_py\_files](#input\_extra\_py\_files) | Libraries/wheel dependencies added to the glue job at run time. | `list(string)` | `[]` | no |
| <a name="input_glue_datacatalog_enabled"></a> [glue\_datacatalog\_enabled](#input\_glue\_datacatalog\_enabled) | Should arguments that allow access to the glue datacatalog for jobs be enabled be used? | `bool` | `false` | no |
| <a name="input_glue_version"></a> [glue\_version](#input\_glue\_version) | The version of glue to use | `string` | `"2.0"` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_job_bookmark_option"></a> [job\_bookmark\_option](#input\_job\_bookmark\_option) | Controls the behavior of a job bookmark. The following option values can be set.<br><br>??????job???bookmark???option Value\|Description\|<br> ---\|---\|<br> job-bookmark-enable\|Keep track of previously processed data. When a job runs, process new data since the last checkpoint.\|<br> job-bookmark-disable\|Always process the entire dataset. You are responsible for managing the output from previous job runs.\|<br> job-bookmark-pause\|Process incremental data since the last successful run or the data in the range identified by the following suboptions, without updating the state of the last bookmark. You are responsible for managing the output from previous job runs. The two suboptions are as follows:\|<br> job-bookmark-from\|<from-value> is the run ID that represents all the input that was processed until the last successful run before and including the specified run ID. The corresponding input is ignored.\|<br> job-bookmark-to \|<to-value> is the run ID that represents all the input that was processed until the last successful run before and including the specified run ID. The corresponding input excluding the input identified by the <from-value> is processed by the job. Any input later than this input is also excluded for processing.\|<br><br> The job bookmark state is not updated when this option set is specified.<br><br> The suboptions are optional. However, when used, both suboptions must be provided. | `string` | `""` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_logging_enabled"></a> [logging\_enabled](#input\_logging\_enabled) | Flag to set cloudwatch metrics be captured for the Glue job. | `bool` | `true` | no |
| <a name="input_max_concurrent_runs"></a> [max\_concurrent\_runs](#input\_max\_concurrent\_runs) | The maximum number of concurrent runs allowed for a job. The default is 1 | `number` | `-1` | no |
| <a name="input_max_retries"></a> [max\_retries](#input\_max\_retries) | The maximum number of times to retry this job if it fails | `number` | `1` | no |
| <a name="input_metrics_enabled"></a> [metrics\_enabled](#input\_metrics\_enabled) | Flag to set cloudwatch metrics be captured for the Glue job. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_number_of_workers"></a> [number\_of\_workers](#input\_number\_of\_workers) | The number of workers of a defined workerType that are allocated when a job runs. | `number` | `2` | no |
| <a name="input_optimal_partition_size"></a> [optimal\_partition\_size](#input\_optimal\_partition\_size) | Optimal partition sizing of your data sets. Defaults to 512mb. Required to use Compaction ETL script that is <br>managed by this module. | `number` | `512` | no |
| <a name="input_python_version"></a> [python\_version](#input\_python\_version) | Version of python supported by this glue job. | `string` | `"3"` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_rename_algorithm_v2_enabled"></a> [rename\_algorithm\_v2\_enabled](#input\_rename\_algorithm\_v2\_enabled) | Sets the EMRFS rename algorithm version to version 2. When a Spark job uses dynamic partition overwrite mode, there is a possibility that a duplicate partition is created. For instance, you can end up with a duplicate partition such as s3://bucket/table/location/p1=1/p1=1. Here, P1 is the partition that is being overwritten. Rename algorithm version 2 fixes this issue. | `bool` | `false` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | The glue service role arn that ETL Job assumes. Needs access to the S3 datalake | `string` | `""` | no |
| <a name="input_s3_parquet_optimized_committer_enabled"></a> [s3\_parquet\_optimized\_committer\_enabled](#input\_s3\_parquet\_optimized\_committer\_enabled) | Should glue jobs be notified to use s3 parquet optimized committer? | `bool` | `false` | no |
| <a name="input_script_s3_key"></a> [script\_s3\_key](#input\_script\_s3\_key) | Script location for generating script from parameters. | `string` | n/a | yes |
| <a name="input_security_configuration"></a> [security\_configuration](#input\_security\_configuration) | The name of the Security Configuration to be associated with the job. | `string` | `""` | no |
| <a name="input_spark_event_logs_path"></a> [spark\_event\_logs\_path](#input\_spark\_event\_logs\_path) | Specifies an Amazon S3 path. When using the Spark UI monitoring feature, AWS Glue flushes the Spark event logs to this Amazon S3 path every 30 seconds to a bucket that can be used as a temporary directory for storing Spark UI events. | `string` | `""` | no |
| <a name="input_spark_ui_enabled"></a> [spark\_ui\_enabled](#input\_spark\_ui\_enabled) | Use Spark interface for monitoring glue jobs. | `bool` | `false` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_tempdir"></a> [tempdir](#input\_tempdir) | Specifies an Amazon S3 path to a bucket that can be used as a temporary directory for the job. | `string` | `""` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | The job timeout in minutes. The default is 2880 minutes (48 hours). | `number` | `2880` | no |
| <a name="input_worker_type"></a> [worker\_type](#input\_worker\_type) | The type of predefined worker that is allocated when a job runs. Accepts a value of Standard, G.1X, or G.2X | `string` | `"G.1X"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the provisioned glue job |
| <a name="output_id"></a> [id](#output\_id) | ID of the provisioned glue job |
| <a name="output_log_group_name"></a> [log\_group\_name](#output\_log\_group\_name) | Name of the log group created for the glue job |
<!-- markdownlint-restore -->
