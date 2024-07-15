output "compute_vpn_gateway" {
    value = {
        for k, v in google_compute_vpn_gateway.CSC : k => {
            id = v.id
        }
    }
}