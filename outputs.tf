output "dataproc_jobs_id" {
  description = "Map of id values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no id are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "dataproc_jobs_deletion_policy" {
  description = "Map of deletion_policy values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no deletion_policy are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "dataproc_jobs_driver_controls_files_uri" {
  description = "Map of driver_controls_files_uri values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no driver_controls_files_uri are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => v.driver_controls_files_uri if v.driver_controls_files_uri != null && length(v.driver_controls_files_uri) > 0 }
}
output "dataproc_jobs_driver_output_resource_uri" {
  description = "Map of driver_output_resource_uri values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no driver_output_resource_uri are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => v.driver_output_resource_uri if v.driver_output_resource_uri != null && length(v.driver_output_resource_uri) > 0 }
}
output "dataproc_jobs_effective_labels" {
  description = "Map of effective_labels values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no effective_labels are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "dataproc_jobs_force_delete" {
  description = "Map of force_delete values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no force_delete are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => v.force_delete if v.force_delete != null }
}
output "dataproc_jobs_hadoop_config" {
  description = "Map of hadoop_config values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no hadoop_config are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => one(v.hadoop_config) if v.hadoop_config != null && length(v.hadoop_config) > 0 }
}
output "dataproc_jobs_hive_config" {
  description = "Map of hive_config values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no hive_config are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => one(v.hive_config) if v.hive_config != null && length(v.hive_config) > 0 }
}
output "dataproc_jobs_labels" {
  description = "Map of labels values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no labels are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "dataproc_jobs_pig_config" {
  description = "Map of pig_config values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no pig_config are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => one(v.pig_config) if v.pig_config != null && length(v.pig_config) > 0 }
}
output "dataproc_jobs_placement" {
  description = "Map of placement values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no placement are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => one(v.placement) if v.placement != null && length(v.placement) > 0 }
}
output "dataproc_jobs_presto_config" {
  description = "Map of presto_config values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no presto_config are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => one(v.presto_config) if v.presto_config != null && length(v.presto_config) > 0 }
}
output "dataproc_jobs_project" {
  description = "Map of project values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no project are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => v.project if v.project != null && length(v.project) > 0 }
}
output "dataproc_jobs_pyspark_config" {
  description = "Map of pyspark_config values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no pyspark_config are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => one(v.pyspark_config) if v.pyspark_config != null && length(v.pyspark_config) > 0 }
}
output "dataproc_jobs_reference" {
  description = "Map of reference values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no reference are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => one(v.reference) if v.reference != null && length(v.reference) > 0 }
}
output "dataproc_jobs_region" {
  description = "Map of region values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no region are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => v.region if v.region != null && length(v.region) > 0 }
}
output "dataproc_jobs_scheduling" {
  description = "Map of scheduling values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no scheduling are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => one(v.scheduling) if v.scheduling != null && length(v.scheduling) > 0 }
}
output "dataproc_jobs_spark_config" {
  description = "Map of spark_config values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no spark_config are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => one(v.spark_config) if v.spark_config != null && length(v.spark_config) > 0 }
}
output "dataproc_jobs_sparksql_config" {
  description = "Map of sparksql_config values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no sparksql_config are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => one(v.sparksql_config) if v.sparksql_config != null && length(v.sparksql_config) > 0 }
}
output "dataproc_jobs_status" {
  description = "Map of status values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no status are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => v.status if v.status != null && length(v.status) > 0 }
}
output "dataproc_jobs_terraform_labels" {
  description = "Map of terraform_labels values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no terraform_labels are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}
output "dataproc_jobs_wait_for_completion" {
  description = "Map of wait_for_completion values across all dataproc_jobs, keyed the same as var.dataproc_jobs except keys with no wait_for_completion are omitted"
  value       = { for k, v in google_dataproc_job.dataproc_jobs : k => v.wait_for_completion if v.wait_for_completion != null }
}

