# Add Floating ip

resource "openstack_networking_floatingip_v2" "fip1" {
  pool = "public"
}

resource "openstack_compute_floatingip_associate_v2" "fip1" {
  floating_ip = openstack_networking_floatingip_v2.fip1.address
  instance_id = openstack_compute_instance_v2.server.id
}

# Output VM IP Addresses
output "server_private_ip" {
 value = openstack_compute_instance_v2.server.access_ip_v4
}
output "server_floating_ip" {
 value = openstack_networking_floatingip_v2.fip1.address
}
