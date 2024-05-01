resource "google_compute_backend_service" "CSC" {
    for_each = { for k, v in var.compute_backend_service : v.default_service_name => v }
    name = each.value.default_service_name


    affinity_cookie_ttl_sec = each.value.affinity_cookie_ttl_sec
    backend {
        balancing_mode = backend.value.balancing_mode
        capacity_scaler = backend.value.capacity_scaler
        group = backend.value.group
        max_connections = backend.value.max_connections
        max_connections_per_instance = backend.value.max_connections_per_instance
        max_connections_per_endpoint = backend.value.max_connections_per_endpoint
        max_rate = backend.value.max_rate
        max_rate_per_endpoint = backend.value.max_rate_per_endpoint
        max_rate_per_instance = backend.value.max_rate_per_instance
        max_utilization = backend.value.max_utilization

    }
    circuit_breakers {
        max_requests_per_connection = circuit_breakers.value.max_requests_per_connection
        max_connections = circuit_breakers.value.max_connections
        max_pending_requests = circuit_breakers.value.max_pending_requests
        max_requests = circuit_breakers.value.max_requests
        max_retries = circuit_breakers.value.max_retries
    }
    compression_mode = each.value.compression_mode # AUTOMATIC, DISABLED
    
    consistent_hash {
        http_cookie {
            ttl {
                seconds = consistent_hash.value.ttl_sec
                nanos = consistent_hash.value.ttl_nanos
            }
            name = consistent_hash.value.name
            path = consistent_hash.value.path
        }
        http_header_name = consistent_hash.value.http_header_name
        minimum_ring_size = consistent_hash.value.minimum_ring_size
        
    }
    cdn_policy {
        cache_key_policy {
        }
        signed_url_cache_max_age_sec = cdn_policy.value.signed_url_cache_max_age_sec
        default_ttl = cdn_policy.value.default_ttl
        max_ttl = cdn_policy.value.max_ttl
        client_ttl = cdn_policy.value.client_ttl
        negative_caching = cdn_policy.value.negative_caching
        negative_caching_policy {
          
        }
        cache_mode = cdn_policy.value.cache_mode # USE_ORIGIN_HEADERS, FORCE_CACHE_ALL, CACHE_ALL_STATIC
        serve_while_stale = cdn_policy.value.serve_while_stale
        bypass_cache_on_request_headers {
          
        }









    }
    connection_draining_timeout_sec = each.value.connection_draining_timeout_sec
    custom_request_headers = each.value.custom_request_headers
    custom_response_headers = each.value.custom_response_headers
    enable_cdn = each.value.enable_cdn
    health_checks = each.value.health_checks
    
    
    iap {}
    
    load_balancing_scheme = each.value.load_balancing_scheme # EXTERNAL, INTERNAL_SELF_MANAGED, INTERNAL_MANAGED, EXTERNAL_MANAGED

    locality_lb_policy = each.value.locality_lb_policy # ROUND_ROBIN, LEAST_REQUEST, RING_HASH, RANDOM, ORIGINAL_DESTINATION, MAGLEV, WEIGHTED_MAGLEV

    locality_lb_policies {}
    outlier_detection {}

    port_name = each.value.port_name 
    protocol = each.value.protocol # HTTP, HTTPS, HTTP2, TCP, SSL, GRPC, UNSPECIFIED
    security_policy = each.value.security_policy 
    edge_security_policy = each.value.edge_security_policy 

    security_settings {}

    session_affinity = each.value.session_affinity
    timeout_sec = each.value.timeout_sec
    log_config {}

    project = each.value.target_project








}