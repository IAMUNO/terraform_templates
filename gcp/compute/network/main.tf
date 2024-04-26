resource "google_compute_network" "CSC" {
    for_each = { for k, v in var.compute_network : v.default_service_name => v }
    name = ""
    

    
    
    
    }