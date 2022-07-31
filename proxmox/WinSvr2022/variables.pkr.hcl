variable "proxmox_hostname" {
  type = string
}

variable "proxmox_node" {
  type = string
}

variable "proxmox_port" {
  type    = string
  default = "8006"
}

variable "proxmox_username" {
  type = string
}

variable "proxmox_password" {
  type      = string
  sensitive = true
}

variable "os_iso_path" {
  type = string
}

variable "virtio_iso_path" {
  type = string
}

variable "network_bridge" {
  type    = string
  default = "vmbr0"
}

variable "win_answer_file_path" {
  type = string
}

variable "template_name" {
  type = string
}