# Proxmox Templates

## Prerequisites
* Proxmox Server (tested on version `7.2`)
* Packer (tested on version `1.8.2`)
* ISO creation tool on system running Packer (see [Packer docs](https://www.packer.io/plugins/builders/proxmox/iso#cd_files))
    > If running on Windows, `oscdimg.exe` needs to be in your shell path, and can be installed from the [Windows AIK](https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install), selecting the "Deployment Tools" install
* OS Install ISO Images (Windows Server templates assume a volume licensed installation ISO)
* Latest or Stable virtio-win driver/tools ISO - [details here](https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md)
    > Upload both ISO images to Proxmox datastore

## Building

1. Update contents *.pkvars.hcl file with values for your environment
2. Run packer build, specifying -var-file param to the *.pkvars.hcl file.  ex:
    ```bash
    cd proxmox/WinSvr2022
    packer init .
    # build windows server core
    packer build -var-file win2022-core.pkrvars.hcl .
    # build windows server with desktop
    packer build -var-file win2022-desk.pkrvars.hcl .
    ```
3. Monitor VM build process in Proxmox VM console

## Known Issues

* Sometimes the reboot after install doesn't occur and you are left with a a blank screen on the VM.  Stop the VM in Proxmox and start it and unattended install will continue.