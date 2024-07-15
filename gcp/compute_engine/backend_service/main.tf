resource "google_compute_backend_service" "CSC" {
    for_each = { for k, v in var.compute_backend_service : v.default_service_name => v }
    name = each.value.default_service_name


    affinity_cookie_ttl_sec = each.value.affinity_cookie_ttl_sec
    backend {
        balancing_mode = each.value.backend.balancing_mode
        capacity_scaler = each.value.backend.capacity_scaler
        group = each.value.backend.group
        max_connections = each.value.backend.max_connections
        max_connections_per_instance = each.value.backend.max_connections_per_instance
        max_connections_per_endpoint = each.value.backend.max_connections_per_endpoint
        max_rate = each.value.backend.max_rate
        max_rate_per_endpoint = each.value.backend.max_rate_per_endpoint
        max_rate_per_instance = each.value.backend.max_rate_per_instance
        max_utilization = each.value.backend.max_utilization
    }
    circuit_breakers {
        max_requests_per_connection = each.value.circuit_breakers.max_requests_per_connection
        max_connections = each.value.circuit_breakers.max_connections
        max_pending_requests = each.value.circuit_breakers.max_pending_requests
        max_requests = each.value.circuit_breakers.max_requests
        max_retries = each.value.circuit_breakers.max_retries
    }
    compression_mode = each.value.compression_mode # AUTOMATIC, DISABLED
    
    consistent_hash {
        http_cookie {
            ttl {
                seconds = each.value.consistent_hash.ttl_sec
                nanos = each.value.consistent_hash.ttl_nanos
            }
            name = each.value.consistent_hash.http_cookie_name
            path = each.value.consistent_hash.http_cookie_path
        }
        http_header_name = each.value.consistent_hash.http_header_name
        minimum_ring_size = each.value.consistent_hash.minimum_ring_size
    }
    cdn_policy {
        cache_key_policy {
            include_host = each.value.cdn_policy.include_host
            include_protocol = each.value.cdn_policy.include_protocol
            include_query_string = each.value.cdn_policy.include_query_string
            query_string_blacklist = each.value.cdn_policy.query_string_blacklist
            query_string_whitelist = each.value.cdn_policy.query_string_whitelist
            include_http_headers = each.value.cdn_policy.include_http_headers
            include_named_cookies = each.value.cdn_policy.include_named_cookies
        }
        signed_url_cache_max_age_sec = each.value.cdn_policy.signed_url_cache_max_age_sec
        default_ttl = each.value.cdn_policy.default_ttl
        max_ttl = each.value.cdn_policy.max_ttl
        client_ttl = each.value.cdn_policy.client_ttl
        negative_caching = each.value.cdn_policy.negative_caching
        negative_caching_policy {
            code = each.value.cdn_policy.negative_caching_policy_code
            ttl = each.value.cdn_policy.negative_caching_policy_ttl
        }
        cache_mode = each.value.cdn_policy.cache_mode # USE_ORIGIN_HEADERS, FORCE_CACHE_ALL, CACHE_ALL_STATIC
        serve_while_stale = each.value.cdn_policy.serve_while_stale
        bypass_cache_on_request_headers {
            header_name = each.value.cdn_policy.header_name
        }
    }
    connection_draining_timeout_sec = each.value.connection_draining_timeout_sec
    custom_request_headers = each.value.custom_request_headers
    custom_response_headers = each.value.custom_response_headers
    enable_cdn = each.value.enable_cdn
    health_checks = each.value.health_checks
    
    
    iap {
        oauth2_client_id = each.value.oauth2_client_id
        oauth2_client_secret = each.value.oauth2_client_secret
        oauth2_client_secret_sha256 = each.value.oauth2_client_secret_sha256 # sensitive = true
    }
    
    load_balancing_scheme = each.value.load_balancing_scheme # EXTERNAL, INTERNAL_SELF_MANAGED, INTERNAL_MANAGED, EXTERNAL_MANAGED

    locality_lb_policy = each.value.locality_lb_policy # ROUND_ROBIN, LEAST_REQUEST, RING_HASH, RANDOM, ORIGINAL_DESTINATION, MAGLEV, WEIGHTED_MAGLEV

    locality_lb_policies {
        policy {
            name = each.value.policy_name # ROUND_ROBIN / LEAST_REQUEST / RING_HASH / RANDOM / ORIGINAL_DESTINATION / MAGLEV
        }
        custom_policy {
            name = each.value.custom_policy_name
        }
    }
    outlier_detection {
        base_ejection_time {
            seconds = each.value.base_ejection_time_seconds # 0 to 315,576,000,000 
            nanos = each.value.base_ejection_time_nanos # 0 to 999,999,999 
        }
        consecutive_errors = each.value.consecutive_errors # default = 5
        consecutive_gateway_failure = each.value.consecutive_gateway_failure # default = 5
        enforcing_consecutive_errors = each.value.enforcing_consecutive_errors # default = 100
        enforcing_consecutive_gateway_failure = each.value.enforcing_consecutive_gateway_failure # default = 0
        enforcing_success_rate = each.value.enforcing_success_rate # default =100
        interval {
            seconds = each.value.interval_seconds # 0 to 315,576,000,000
            nanos = each.value.interval_nanos # 0 to 999,999,999
        }

        max_ejection_percent = each.value.max_ejection_percent # default = 10
        success_rate_minimum_hosts = each.value.success_rate_minimum_hosts # default = 5
        success_rate_request_volume = each.value.success_rate_minimum_hosts # default = 100
        success_rate_stdev_factor = each.value.success_rate_stdev_factor # default = 1900
    }

    port_name = each.value.port_name 
    protocol = each.value.protocol # HTTP, HTTPS, HTTP2, TCP, SSL, GRPC, UNSPECIFIED
    security_policy = each.value.security_policy 
    edge_security_policy = each.value.edge_security_policy 

    security_settings {
        client_tls_policy = each.value.client_tls_policy
        subject_alt_names = each.value.subject_alt_names 
    }

    session_affinity = each.value.session_affinity
    timeout_sec = each.value.timeout_sec
    log_config {
        enable = each.value.enable_log_config
        sample_rate = each.value.log_config_sample_rate
    }

    project = each.value.target_project








}