variable "compute_network" {
    type = map(object({
      default_service_name = string
      enable_auto_create_subnetworks = bool 
      # true - will create a subnet for each region automatically across the 10.128.0.0/9
      # false - the network is created in "custom subnet mode" so the user can explicitly connect subnetwork resources
      routing_mode = string # REGIONAL, GLOBAL
      mtu = number # default=1460(byte) / 1300~8896
      enable_ula_internal_ipv6  = bool # true/ false(def)
      internal_ipv6_range = string
      network_firewall_policy_enforcement_order = string # AFTER_CLASSIC_FIREWALL(def), BEFORE_CLASSIC_FIREWALL
      target_project_id = string # If it is not provided, the provider project is used.
      delete_default_routes_on_create = bool # true/ false(def). If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation
    }))
    description = ""
    default = {
        "network1" = {
            "default_service_name" = ""
            "enable_auto_create_subnetworks" = false
            "routing_mode" = ""
            "mtu" = ""
            "enable_ula_internal_ipv6" = false
            "internal_ipv6_range" = ""
            "network_firewall_policy_enforcement_order" = ""
            "target_project_id" = ""
            "delete_default_routes_on_create" = false
        }
    }
  
}