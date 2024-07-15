resource "google_container_analysis_note" "CSC" {
    for_each = {  for k, v in var.container_analysis_note : v.default_service_name => v }
    name = each.value.default_service_name
    short_description = each.value.short_description
    long_description = each.value.long_description
    expiration_time = each.value.expiration_time

    attestation_authority {
        hint {
            human_readable_name = each.value.hint_human_readable_name
        }
    }

    dynamic "related_url" {
        for_each = each.value.related_url
        content {
            url = related_url.value.url
            label = related_url.value.label
        }
    }
}