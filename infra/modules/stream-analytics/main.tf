resource "azurerm_stream_analytics_job" "job" {
  location             = var.location
  resource_group_name  = var.rg_name
  tags                 = var.tags
  name                 = var.job_name
  compatibility_level  = "1.2"
  streaming_units      = 1
  transformation_query = <<QUERY
SELECT
    *
INTO
    [output-to-blob-storage]
FROM
    [input-iothub]
WHERE
    Temperature > 27
QUERY
}

resource "azurerm_stream_analytics_output_blob" "output_blob" {
  name                      = "output-to-blob-storage"
  stream_analytics_job_name = azurerm_stream_analytics_job.job.name
  resource_group_name       = var.rg_name
  storage_account_name      = var.storage_account_name
  storage_account_key       = var.storage_account_key
  storage_container_name    = var.storage_container_name
  path_pattern              = "some-pattern"
  date_format               = "yyyy-MM-dd"
  time_format               = "HH"

  serialization {
    type            = "Csv"
    encoding        = "UTF8"
    field_delimiter = ","
  }
}

resource "azurerm_stream_analytics_stream_input_iothub" "input_iothub" {
  name                         = "input-iothub"
  stream_analytics_job_name    = azurerm_stream_analytics_job.job.name
  resource_group_name          = var.rg_name
  endpoint                     = "messages/events"
  eventhub_consumer_group_name = "$Default"
  iothub_namespace             = var.iothub_namespace
  shared_access_policy_key     = var.iothub_shared_access_policy_key
  shared_access_policy_name    = "iothubowner"

  serialization {
    type     = "Json"
    encoding = "UTF8"
  }
}
