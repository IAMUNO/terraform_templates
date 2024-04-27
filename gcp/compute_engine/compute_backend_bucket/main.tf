resource "google_compute_backend_bucket" "CSC" {
    for_each = { for k, v in var.compute_backend_bucket : v.default_service_name => v }
    bucket_name = each.value.linked_storage_bucket_name
    name = each.value.default_service_name
    
    dynamic "cdn_policy" {
        for_each = each.value.cdn_policy
        content {
            dynamic "cache_key_policy" {
                for_each = cdn_policy.value.cache_key_policy
                content {
                    query_string_whitelist = cache_key_policy.value.query_string_whitelist
                    include_http_headers = cache_key_policy.value.include_http_headers
                }
            }

            signed_url_cache_max_age_sec = cdn_policy.value.signed_url_cache_max_age_sec
            default_ttl = cdn_policy.value.default_ttl
            max_ttl = cdn_policy.value.max_ttl
            client_ttl = cdn_policy.value.client_ttl
            negative_caching = cdn_policy.value.negative_caching

            dynamic "negative_caching_policy" {
                for_each = cdn_policy.value.negative_caching_policy
                content {
                    code = negative_caching_policy.value.code
                    ttl = negative_caching_policy.value.ttl
                }
            }
            cache_mode = cdn_policy.value.cache_mode
            serve_while_stale = cdn_policy.value.serve_while_stale 
            request_coalescing = cdn_policy.value.request_coalescing
            
            dynamic "bypass_cache_on_request_headers" {
                for_each = cdn_policy.value.bypass_cache_on_request_headers
                content {
                    header_name = bypass_cache_on_request_headers.value.header_name
                }
            }
        }
    }
    compression_mode = each.value.compression_mode
    edge_security_policy = each.value.edge_security_policy
    custom_response_headers = each.value.custom_response_headers
    enable_cdn = each.value.enable_cdn
    project = each.value.target_project
}