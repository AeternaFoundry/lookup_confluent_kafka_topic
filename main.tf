data "confluent_kafka_topic" "kafka_topic_lookup" {
  for_each = var.kafka_topic_lookup

  rest_endpoint = each.value.rest_endpoint
  topic_name    = each.value.topic_name

  dynamic "credentials" {
    for_each = each.value.credentials != null ? [each.value.credentials] : []
    content {
      key    = credentials.value.key
      secret = credentials.value.secret
    }
  }

  dynamic "kafka_cluster" {
    for_each = each.value.kafka_cluster != null ? [each.value.kafka_cluster] : []
    content {
      id = kafka_cluster.value.id
    }
  }
}

