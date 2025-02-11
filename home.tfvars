# Environment
########################################################################
env_name       = "home"
location       = null
cluster_number = "01"
cluster_domain = "local"
# If using this project version >= 4.0.0 with a previously provisioned cluster,
# check this setting: https://github.com/khanh-ph/proxmox-kubernetes/releases/tag/4.0.0
use_legacy_naming_convention = false

# Proxmox VE
########################################################################
# Proxmox VE API details and VM hosting configuration
# API token guide: https://registry.terraform.io/providers/Telmate/proxmox/latest/docs
pm_api_url          = "https://localhost:8006/api2/json"
pm_api_token_id     = "root@pam!iac"
pm_api_token_secret = "5e55f281-79e1-4b84-9efb-c076909eda12"
pm_tls_insecure     = true
pm_hosts            = ["phony"]
pm_parallel         = 2
pm_timeout          = 600


# Common infrastructure configurations
########################################################################
# Kubernetes internal network
internal_net_name = "vmbr0"
# Internal network MTU (you only need to change this when mtu is different from the default host settings)
#internal_net_mtu = 1500
# Internal network CIDR
internal_net_subnet_cidr = "192.168.2.0/24"
# Base64 encoded keys for Kubernetes admin authentication
ssh_public_keys = "c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUFhOURxNDdrSjZCUWlxaVJSL1lmQ0FTMS9yVkVJZnBsMHJYMkpWekZyb2wgcGhvbmcudnVAcGhvbmd2dQo="

# Default disk storage for the VMs. Uncomment the following line if needed
vm_os_disk_storage = "local-lvm"

# Bastion host details. This is required for the Terraform client to 
# connect to the Kubespray VM that will be placed into the internet network
bastion_ssh_ip   = "100.116.173.51"
bastion_ssh_user = "root"
bastion_ssh_port = 22

# VM specifications
########################################################################
# Maximum cores that your Proxmox VE server can give to a VM
vm_max_vcpus = 1
# Control plane VM specifications
vm_k8s_control_plane = {
  node_count = 1
  vcpus      = 1
  memory     = 2048
  disk_size  = 20
}
# Worker nodes VM specifications
vm_k8s_worker = {
  node_count = 3
  vcpus      = 1
  memory     = 3072
  disk_size  = 20
}

# Kubernetes settings
########################################################################
kube_version               = "v1.29.5"
kube_network_plugin        = "calico"
enable_nodelocaldns        = false
podsecuritypolicy_enabled  = false
persistent_volumes_enabled = false
helm_enabled               = true
ingress_nginx_enabled      = false
argocd_enabled             = false
argocd_version             = "v2.11.4"

