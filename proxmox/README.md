# Proxmox Templates

## Pre-reqs:
* ISO creation tool installed on system running packer (see Packer docs or comments in template files for more info)
* OS Install ISO Images (Windows Server templates assume a volume licensed ISO)
* Latest or Stable virtio-win driver/tools ISO - [details here](https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md)

Upload both ISO images to Proxmox datastore

## Building:

1. Update contents *.pkvars.hcl file with values for your environment
2. Run packer build, specifying -var-file param to the *.pkvars.hcl file.  ex:

    ```bash
    cd proxmox/WinSvr2022
    packer init .
    packer build -var-file win2022.pkrvars.hcl .
    ```
