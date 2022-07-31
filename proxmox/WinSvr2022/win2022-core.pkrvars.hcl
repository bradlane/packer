# Proxmox Connection Info
proxmox_hostname = "<HOSTNAME_OR_IP_OF_PROXMOXAPI>"
proxmox_port     = "8006"
proxmox_node     = "<NODE_NAME>"
proxmox_username = "root@pam"
proxmox_password = "<ROOT_PASSWORD>"

# Template
template_name        = "win2022-core"
win_answer_file_path = "../../files/win/answer_files/win2022-core/autounattend.xml"

# ISO Images
# Example uses 'local' datastore - adjust path, if yours is different
os_iso_path     = "local:iso/<OS_ISO_FILENAME>"
virtio_iso_path = "local:iso/<VIRTIO-WIN_ISO_FILENAME>"
