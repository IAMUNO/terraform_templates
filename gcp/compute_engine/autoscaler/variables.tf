variable "compute_autoscaler" {
    type = map(object({
        default_service_name = string # re
        target_instance_group = string # re
        zone = string 
        target_project = string
        autoscaling_policy = map(object({
            min_replicas = string
            max_replicas = string
            cooldown_period = string
            mode = string
            scale_in_control = map(object({
                fixed_number = string
                percent = string
                time_window_sec = string
            }))
            cpu_utilization = map(object({
                cpu_utilization_target = string
                predictive_method = string # NONE(def), OPTIMIZE_AVAILABILITY
            }))
            metric = map(object({
                metric_name = string 
                metric_target = string
                metric_type = string # GAUGE, DELTA_PER_SECOND, DELTA_PER_MINUTE
            }))
            load_balancing_utilization = map(object({
                load_balancing_utilization_target = string 
            }))
            scaling_schedules = map(object({
                scaling_schedules_name = string 
                min_required_replicas = string 
                schedule = string 
                time_zone = string 
                duration_sec = string 
                disabled = string 
            }))
        }))
    }))
    description = ""
    default = {
        "autoscaler1" = {
            "default_service_name" = ""
            "target_instance_group" = ""
            "zone" = ""
            "target_project" = ""
            "autoscaling_policy" = {}
        }
    }
}