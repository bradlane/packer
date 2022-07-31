/*
  Windows Server 2022 Proxmox Packer Template

  Running from Windows?  Need oscdimg.exe from Windows AIK - Deployment Tools install:
    https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install
  
  Running from Linux?  Need Packer will use one of the following tools: xorriso or mkisofs

*/

packer {
  required_plugins {
    proxmox = {
      version = ">= 1.0.6"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

locals {
  proxmox_url = "https://${var.proxmox_hostname}:${var.proxmox_port}/api2/json"
}

source "proxmox-iso" "windows" {
  # General Settings
  vm_name     = "${var.template_name}"
  os          = "win11"
  bios        = "ovmf"
  unmount_iso = true
  qemu_agent  = true

  # VM Hardware
  sockets = 1
  memory  = 4096

  # OS Disk
  scsi_controller = "virtio-scsi-pci"
  disks {
    disk_size         = "60G"
    storage_pool      = "local-lvm"
    storage_pool_type = "lvm"
  }

  # Network
  network_adapters {
    model  = "virtio"
    bridge = "${var.network_bridge}"
  }

  # ISO Boot
  boot_command = ["<enter>"]
  boot_wait    = "8s"

  # OS ISO, VirtIO ISO, Windows Installer answer files & setup scripts
  iso_file = "${var.os_iso_path}"
  additional_iso_files {
    device   = "sata1"
    iso_file = "${var.virtio_iso_path}"
    unmount  = true
  }
  additional_iso_files {
    device           = "sata2"
    cd_files         = ["${var.win_answer_file_path}", "../../files/win/scripts/winrm_setup.ps1"]
    iso_storage_pool = "local"
  }

  # OS Connection
  communicator   = "winrm"
  winrm_password = "packer"
  winrm_insecure = "true"
  winrm_use_ssl  = "true"
  winrm_username = "Administrator"

  # Proxmox
  proxmox_url              = "${local.proxmox_url}"
  insecure_skip_tls_verify = true
  node                     = "${var.proxmox_node}"
  username                 = "${var.proxmox_username}"
  password                 = "${var.proxmox_password}"
}

build {
  sources = ["source.proxmox-iso.windows"]

  ## Run other post-reboot scripts
  #provisioner "powershell" {
  #  environment_vars = [
  #  ]
  #  scripts = [
  #  ]
  #}
}
