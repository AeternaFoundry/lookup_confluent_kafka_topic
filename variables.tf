variable "kafka_topic_lookup" {
  description = <<EOT
Map of kafka_topic_lookup, attributes below
Required:
    - rest_endpoint
    - topic_name
Optional:
    - credentials (block):
        - key (required)
        - secret (required)
    - kafka_cluster (block):
        - id (required)
EOT

  type = map(object({
    rest_endpoint = string
    topic_name    = string
    credentials = optional(object({
      key    = string
      secret = string
    }))
    kafka_cluster = optional(object({
      id = string
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

