# Variables
variable "keypair" {
  type    = string
  default = "XXXXX"   # name of keypair that will have access to the VM 
}

variable "network" {
  type    = string
  default = "XXXXX" # default network to be used
}

variable "security_groups" {
  type    = list(string)
  default = ["XXXX"]  # Name of default security group
}

# Data sources
## Get Image ID
data "openstack_images_image_v2" "image" {
  name        = "CentOS-7" # Name of image to be used
  most_recent = true
}

## Get flavor id
data "openstack_compute_flavor_v2" "flavor" {
  name = "standard.tiny" # flavor to be used
}

# Create an instance
resource "openstack_compute_instance_v2" "server" {
  name            = "Terraform-test-XXXX"  #Instance name
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id
  key_pair        = var.keypair
  security_groups = var.security_groups

  network {
    name = var.network
  }
}

# Output VM IP Address
output "serverip" {
 value = openstack_compute_instance_v2.server.access_ip_v4
}
