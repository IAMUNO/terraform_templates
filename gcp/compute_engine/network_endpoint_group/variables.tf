variable "compute_network_endpoint_group" {
    type = map(object({
        default_service_name = string # re
        target_network = string # re
        network_endpoint_type = string # op // GCE_VM_IP, GCE_VM_IP_PORT(def), NON_GCP_PRIVATE_IP_PORT, INTERNET_IP_PORT, INTERNET_FQDN_PORT, SERVERLESS, PRIVATE_SERVICE_CONNECT
        target_subnetwork = string # op
        default_port = string # op
        zone = string # op
        target_project = string # op
    }))
    description = ""
    default = {
        "endpoint_group1" = {
            "default_service_name" = ""
            "target_network" = ""
            "network_endpoint_type" = ""
            "target_subnetwork" = ""
            "default_port" = ""
            "zone" = ""
            "target_project" = ""
        }
    }
}