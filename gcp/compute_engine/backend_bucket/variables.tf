variable "compute_backend_bucket" {
    type = map(object({
        default_service_name = string # re
        linked_storage_bucket_name = string # re
        cdn_policy = map(object({
            cache_key_policy = map(object({
                query_string_whitelist = list(string)
                include_http_headers = bool
            }))
            signed_url_cache_max_age_sec = string
            default_ttl = string
            max_ttl = string
            client_ttl = string 
            negative_caching = string
            negative_caching_policy = map(object({
                code = string 
                ttl = string 
            }))
            cache_mode = string # USE_ORIGIN_HEADERS, FORCE_CACHE_ALL, CACHE_ALL_STATIC
            serve_while_stale = string 
            request_coalescing = string 
            bypass_cache_on_request_headers = map(object({
                header_name = string 
            }))
        }))
        compression_mode = string # AUTOMATIC, DISABLED
        edge_security_policy = string 
        custom_response_headers = string 
        enable_cdn = bool
        target_project = string 
    }))
    description = ""
    default = {
        "backend_bucket1" = {
            "default_service_name" = ""
            "linked_storage_bucket_name" = ""
            "cdn_policy" = {}
            "compression_mode" = ""
            "edge_security_policy" = ""
            "custom_response_headers" = ""
            "enable_cdn" = false
            "target_project" = ""
        }
    }
}