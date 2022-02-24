variable "auto_scaling_enabled" {
  description = "Should autoscaling arguments be passed to glue jobs at execution time?"
  type        = bool
  default     = false
}

variable "connections" {
  description = "(Optional) The list of connections used for this job."
  type        = list(string)
  default     = []
}

variable "extra_py_files" {
  description = "Libraries/wheel dependencies added to the glue job at run time."
  type        = list(string)
  default     = []
}

variable "glue_datacatalog_enabled" {
  description = "Should arguments that allow access to the glue datacatalog for jobs be enabled be used?"
  type        = bool
  default     = false
}

variable "role_arn" {
  description = "The glue service role arn that ETL Job assumes. Needs access to the S3 datalake"
  type        = string
  default     = ""
}

variable "glue_version" {
  description = "The version of glue to use"
  type        = string
  default     = "2.0"
}

variable "default_arguments" {
  description = "default arguments for the job"
  type        = map(string)
  default     = {}
}

variable "timeout" {
  description = "The job timeout in minutes. The default is 2880 minutes (48 hours)."
  type        = number
  default     = 2880
}

variable "logging_enabled" {
  description = "Flag to set cloudwatch metrics be captured for the Glue job."
  type        = bool
  default     = true
}

variable "cloudwatch_logs_retention_in_days" {
  description = <<-EOT
  Number of days you want to retain log events in the log group.

  Must be one of: [0 1 3 5 7 14 30 60 90 120 150 180 365 400 545 731 1827 3653]

  Ignored if `var.cloudwatch_logs_enabled` is set to `false`.
  EOT
  default     = "90"
}

variable "cloudwatch_event_rules" {
  description = <<-EOT
  List of rules describing cloudwatch events. This is used for updating an SNS topic that sends notifications over SES.
  EOT
  type = set(object({
    description = string
    pattern     = any
  }))
  default = []
}

variable "sns_topic_subscribers" {
  description = <<-EOT
  List of email address of people subscribing to the sns topic notifications.
  EOT
  type        = set(string)
  default     = []
}

variable "sns_topic_allowed_aws_services_for_sns_published" {
  type        = list(string)
  description = "AWS services that will have permission to publish to SNS topic. Used when no external JSON policy is used. Defaults to events.amazonaws.com to allow event bridge to publish to sns topic"
  default     = ["events.amazonaws.com"]
}

variable "max_concurrent_runs" {
  description = "The maximum number of concurrent runs allowed for a job. The default is 1"
  type        = number
  default     = -1
}

variable "max_retries" {
  description = "The maximum number of times to retry this job if it fails"
  type        = number
  default     = 1
}

variable "metrics_enabled" {
  description = "Flag to set cloudwatch metrics be captured for the Glue job."
  type        = bool
  default     = false
}


variable "number_of_workers" {
  description = "The number of workers of a defined workerType that are allocated when a job runs."
  type        = number
  default     = 2
}

variable "optimal_partition_size" {
  description = <<-EOT
  Optimal partition sizing of your data sets. Defaults to 512mb. Required to use Compaction ETL script that is 
  managed by this module.
  EOT
  type        = number
  default     = 512
}

variable "python_version" {
  description = <<-EOT
  Version of python supported by this glue job.
  EOT
  type        = string
  default     = ""
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "script_location" {
  description = "User supplied script path on S3"
  type        = string
  default     = ""
}

variable "script_s3_bucket" {
  description = <<-EOT
  S3 Bucket that script will be uploaded. Required to use Compaction ETL script that is managed by this module
  EOT
  type        = string
  default     = ""
}

variable "script_s3_prefix" {
  description = <<-EOT
  S3 prefix to upload TF supplied ETL script. Required to use Compaction ETL script that is managed by this module
  EOT
  type        = string
  default     = ""
}

variable "script_s3_key" {
  description = "Script location for generating script from parameters."
  type        = string
}

variable "s3_parquet_optimized_committer_enabled" {
  description = "Should glue jobs be notified to use s3 parquet optimized committer?"
  type        = bool
  default     = false
}


variable "security_configuration" {
  description = <<-EOT
  (Optional) The name of the Security Configuration to be associated with the job.
  EOT
  type        = string
  default     = ""
}

variable "spark_ui_enabled" {
  description = <<-EOT
  (Optional) Use Spark interface for monitoring glue jobs.
  EOT
  type        = bool
  default     = false
}

variable "worker_type" {
  description = "The type of predefined worker that is allocated when a job runs. Accepts a value of Standard, G.1X, or G.2X"
  type        = string
  default     = "G.1X"
}
