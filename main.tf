resource "google_dataproc_job" "dataproc_jobs" {
  for_each = var.dataproc_jobs

  deletion_policy     = each.value.deletion_policy
  force_delete        = each.value.force_delete
  labels              = each.value.labels
  project             = each.value.project
  region              = each.value.region
  wait_for_completion = each.value.wait_for_completion

  placement {
    cluster_name = each.value.placement.cluster_name
  }

  dynamic "hadoop_config" {
    for_each = each.value.hadoop_config != null ? [each.value.hadoop_config] : []
    content {
      archive_uris  = hadoop_config.value.archive_uris
      args          = hadoop_config.value.args
      file_uris     = hadoop_config.value.file_uris
      jar_file_uris = hadoop_config.value.jar_file_uris
      dynamic "logging_config" {
        for_each = hadoop_config.value.logging_config != null ? [hadoop_config.value.logging_config] : []
        content {
          driver_log_levels = logging_config.value.driver_log_levels
        }
      }
      main_class        = hadoop_config.value.main_class
      main_jar_file_uri = hadoop_config.value.main_jar_file_uri
      properties        = hadoop_config.value.properties
    }
  }

  dynamic "hive_config" {
    for_each = each.value.hive_config != null ? [each.value.hive_config] : []
    content {
      continue_on_failure = hive_config.value.continue_on_failure
      jar_file_uris       = hive_config.value.jar_file_uris
      properties          = hive_config.value.properties
      query_file_uri      = hive_config.value.query_file_uri
      query_list          = hive_config.value.query_list
      script_variables    = hive_config.value.script_variables
    }
  }

  dynamic "pig_config" {
    for_each = each.value.pig_config != null ? [each.value.pig_config] : []
    content {
      continue_on_failure = pig_config.value.continue_on_failure
      jar_file_uris       = pig_config.value.jar_file_uris
      dynamic "logging_config" {
        for_each = pig_config.value.logging_config != null ? [pig_config.value.logging_config] : []
        content {
          driver_log_levels = logging_config.value.driver_log_levels
        }
      }
      properties       = pig_config.value.properties
      query_file_uri   = pig_config.value.query_file_uri
      query_list       = pig_config.value.query_list
      script_variables = pig_config.value.script_variables
    }
  }

  dynamic "presto_config" {
    for_each = each.value.presto_config != null ? [each.value.presto_config] : []
    content {
      client_tags         = presto_config.value.client_tags
      continue_on_failure = presto_config.value.continue_on_failure
      dynamic "logging_config" {
        for_each = presto_config.value.logging_config != null ? [presto_config.value.logging_config] : []
        content {
          driver_log_levels = logging_config.value.driver_log_levels
        }
      }
      output_format  = presto_config.value.output_format
      properties     = presto_config.value.properties
      query_file_uri = presto_config.value.query_file_uri
      query_list     = presto_config.value.query_list
    }
  }

  dynamic "pyspark_config" {
    for_each = each.value.pyspark_config != null ? [each.value.pyspark_config] : []
    content {
      archive_uris  = pyspark_config.value.archive_uris
      args          = pyspark_config.value.args
      file_uris     = pyspark_config.value.file_uris
      jar_file_uris = pyspark_config.value.jar_file_uris
      dynamic "logging_config" {
        for_each = pyspark_config.value.logging_config != null ? [pyspark_config.value.logging_config] : []
        content {
          driver_log_levels = logging_config.value.driver_log_levels
        }
      }
      main_python_file_uri = pyspark_config.value.main_python_file_uri
      properties           = pyspark_config.value.properties
      python_file_uris     = pyspark_config.value.python_file_uris
    }
  }

  dynamic "reference" {
    for_each = each.value.reference != null ? [each.value.reference] : []
    content {
      job_id = reference.value.job_id
    }
  }

  dynamic "scheduling" {
    for_each = each.value.scheduling != null ? [each.value.scheduling] : []
    content {
      max_failures_per_hour = scheduling.value.max_failures_per_hour
      max_failures_total    = scheduling.value.max_failures_total
    }
  }

  dynamic "spark_config" {
    for_each = each.value.spark_config != null ? [each.value.spark_config] : []
    content {
      archive_uris  = spark_config.value.archive_uris
      args          = spark_config.value.args
      file_uris     = spark_config.value.file_uris
      jar_file_uris = spark_config.value.jar_file_uris
      dynamic "logging_config" {
        for_each = spark_config.value.logging_config != null ? [spark_config.value.logging_config] : []
        content {
          driver_log_levels = logging_config.value.driver_log_levels
        }
      }
      main_class        = spark_config.value.main_class
      main_jar_file_uri = spark_config.value.main_jar_file_uri
      properties        = spark_config.value.properties
    }
  }

  dynamic "sparksql_config" {
    for_each = each.value.sparksql_config != null ? [each.value.sparksql_config] : []
    content {
      jar_file_uris = sparksql_config.value.jar_file_uris
      dynamic "logging_config" {
        for_each = sparksql_config.value.logging_config != null ? [sparksql_config.value.logging_config] : []
        content {
          driver_log_levels = logging_config.value.driver_log_levels
        }
      }
      properties       = sparksql_config.value.properties
      query_file_uri   = sparksql_config.value.query_file_uri
      query_list       = sparksql_config.value.query_list
      script_variables = sparksql_config.value.script_variables
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}

