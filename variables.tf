variable "dataproc_jobs" {
  description = <<EOT
Map of dataproc_jobs, attributes below
Required:
    - placement (block):
        - cluster_name (required)
Optional:
    - deletion_policy
    - force_delete
    - labels
    - project
    - region
    - wait_for_completion
    - hadoop_config (block):
        - archive_uris (optional)
        - args (optional)
        - file_uris (optional)
        - jar_file_uris (optional)
        - logging_config (optional, block):
            - driver_log_levels (required)
        - main_class (optional)
        - main_jar_file_uri (optional)
        - properties (optional)
    - hive_config (block):
        - continue_on_failure (optional)
        - jar_file_uris (optional)
        - properties (optional)
        - query_file_uri (optional)
        - query_list (optional)
        - script_variables (optional)
    - pig_config (block):
        - continue_on_failure (optional)
        - jar_file_uris (optional)
        - logging_config (optional, block):
            - driver_log_levels (required)
        - properties (optional)
        - query_file_uri (optional)
        - query_list (optional)
        - script_variables (optional)
    - presto_config (block):
        - client_tags (optional)
        - continue_on_failure (optional)
        - logging_config (optional, block):
            - driver_log_levels (required)
        - output_format (optional)
        - properties (optional)
        - query_file_uri (optional)
        - query_list (optional)
    - pyspark_config (block):
        - archive_uris (optional)
        - args (optional)
        - file_uris (optional)
        - jar_file_uris (optional)
        - logging_config (optional, block):
            - driver_log_levels (required)
        - main_python_file_uri (required)
        - properties (optional)
        - python_file_uris (optional)
    - reference (block):
        - job_id (optional)
    - scheduling (block):
        - max_failures_per_hour (required)
        - max_failures_total (required)
    - spark_config (block):
        - archive_uris (optional)
        - args (optional)
        - file_uris (optional)
        - jar_file_uris (optional)
        - logging_config (optional, block):
            - driver_log_levels (required)
        - main_class (optional)
        - main_jar_file_uri (optional)
        - properties (optional)
    - sparksql_config (block):
        - jar_file_uris (optional)
        - logging_config (optional, block):
            - driver_log_levels (required)
        - properties (optional)
        - query_file_uri (optional)
        - query_list (optional)
        - script_variables (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
EOT

  type = map(object({
    deletion_policy     = optional(string)
    force_delete        = optional(bool)
    labels              = optional(map(string))
    project             = optional(string)
    region              = optional(string)
    wait_for_completion = optional(bool)
    placement = object({
      cluster_name = string
    })
    hadoop_config = optional(object({
      archive_uris  = optional(list(string))
      args          = optional(list(string))
      file_uris     = optional(list(string))
      jar_file_uris = optional(list(string))
      logging_config = optional(object({
        driver_log_levels = map(string)
      }))
      main_class        = optional(string)
      main_jar_file_uri = optional(string)
      properties        = optional(map(string))
    }))
    hive_config = optional(object({
      continue_on_failure = optional(bool)
      jar_file_uris       = optional(list(string))
      properties          = optional(map(string))
      query_file_uri      = optional(string)
      query_list          = optional(list(string))
      script_variables    = optional(map(string))
    }))
    pig_config = optional(object({
      continue_on_failure = optional(bool)
      jar_file_uris       = optional(list(string))
      logging_config = optional(object({
        driver_log_levels = map(string)
      }))
      properties       = optional(map(string))
      query_file_uri   = optional(string)
      query_list       = optional(list(string))
      script_variables = optional(map(string))
    }))
    presto_config = optional(object({
      client_tags         = optional(list(string))
      continue_on_failure = optional(bool)
      logging_config = optional(object({
        driver_log_levels = map(string)
      }))
      output_format  = optional(string)
      properties     = optional(map(string))
      query_file_uri = optional(string)
      query_list     = optional(list(string))
    }))
    pyspark_config = optional(object({
      archive_uris  = optional(list(string))
      args          = optional(list(string))
      file_uris     = optional(list(string))
      jar_file_uris = optional(list(string))
      logging_config = optional(object({
        driver_log_levels = map(string)
      }))
      main_python_file_uri = string
      properties           = optional(map(string))
      python_file_uris     = optional(list(string))
    }))
    reference = optional(object({
      job_id = optional(string)
    }))
    scheduling = optional(object({
      max_failures_per_hour = number
      max_failures_total    = number
    }))
    spark_config = optional(object({
      archive_uris  = optional(list(string))
      args          = optional(list(string))
      file_uris     = optional(list(string))
      jar_file_uris = optional(list(string))
      logging_config = optional(object({
        driver_log_levels = map(string)
      }))
      main_class        = optional(string)
      main_jar_file_uri = optional(string)
      properties        = optional(map(string))
    }))
    sparksql_config = optional(object({
      jar_file_uris = optional(list(string))
      logging_config = optional(object({
        driver_log_levels = map(string)
      }))
      properties       = optional(map(string))
      query_file_uri   = optional(string)
      query_list       = optional(list(string))
      script_variables = optional(map(string))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dataproc_jobs : (
        v.scheduling == null || (v.scheduling.max_failures_per_hour <= 10)
      )
    ])
    error_message = "must be at most 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_jobs : (
        v.scheduling == null || (v.scheduling.max_failures_total <= 240)
      )
    ])
    error_message = "must be at most 240"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

