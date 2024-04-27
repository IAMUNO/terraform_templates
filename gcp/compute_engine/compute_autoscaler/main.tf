resource "google_compute_autoscaler" "CSC" {
    for_each = { for k, v in var.compute_autoscaler : v.default_service_name => v }
    name = each.value.default_service_name
    target = each.value.target_instance_group
    zone = each.value.zone
    project = each.value.target_project

    dynamic "autoscaling_policy" {
        for_each = each.value.autoscaling_policy
        content {
            min_replicas = autoscaling_policy.value.min_replicas
            max_replicas = autoscaling_policy.value.max_replicas
            cooldown_period = autoscaling_policy.value.cooldown_period
            mode = autoscaling_policy.value.mode
            
            dynamic "scale_in_control" {
                for_each = autoscaling_policy.value.scale_in_control
                content {
                    max_scaled_in_replicas {
                        fixed = scale_in_control.value.fixed_number
                        percent = scale_in_control.value.percent
                    }
                    time_window_sec = scale_in_control.value.time_window_sec
                }
            }

            dynamic "cpu_utilization" {
                for_each = autoscaling_policy.value.cpu_utilization
                content {
                    target = cpu_utilization.value.cpu_utilization_target
                    predictive_method = cpu_utilization.value.predictive_method
                }
            }

            dynamic "metric" {
                for_each = autoscaling_policy.value.metric
                content {
                    name = metric.value.metric_name
                    target = metric.value.metric_target
                    type = metric.value.type.value.metric_type 
                }
            }

            dynamic "load_balancing_utilization" {
                for_each = autoscaling_policy.value.load_balancing_utilization
                content {
                    target = load_balancing_utilization.value.load_balancing_utilization_target
                }
            }

            dynamic "scaling_schedules" {
                for_each = autoscaling_policy.value.scaling_schedules
                content {
                    name = autoscaling_policy.value.scaling_schedules_name
                    min_required_replicas = autoscaling_policy.value.min_required_replicas
                    schedule = autoscaling_policy.value.schedule
                    time_zone =  autoscaling_policy.value.time_zone
                    duration_sec = autoscaling_policy.value.duration_sec
                    disabled = autoscaling_policy.value.disabled
                }
            }
        }
    }

}