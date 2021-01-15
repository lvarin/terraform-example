# Terraform example

This is a small example that uses the Openstack provider to create a VM and attach to it a virtual IP. 

## Quick start

* [Install terraform](https://www.terraform.io/downloads.html)

* Log in Openstack sourcing the openrc file thjat your Openstack instance provides.

* Edit `main.tf` with the correct values for the name of **keypair** (`openstack keypair list`), **network** (`openstack network list`) and **security_groups** (`openstack security group list`).

* Then just do:

```sh
terraform init
terraform plan
terraform apply # This is the step that creates the VM
```
