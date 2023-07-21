The Packer Plugin for VMware with to create virtual machine images for use with VMware products.

### Installation
Packer v1.7.0 and later

```hcl
packer {
  required_plugins {
    vmware = {
      version = "~> 1"
      source = "github.com/hashicorp/vmware"
    }
  }
}
```

### Components
The plugin includes two builders which are able to create images, depending on your desired strategy

#### Builders

- [vmware-iso](/packer/integrations/hashicorp/vmware/lates/components/builders/iso) - Starts from an ISO file,
  creates a brand new VMware VM, installs an OS, provisions software within
  the OS, then exports that machine to create an image. This is best for
  people who want to start from scratch.

- [vmware-vmx](/packer/integrations/hashicorp/vmware/latest/components/builders/vmx) - This builder imports an
  existing VMware machine (from a VMX file), runs provisioners on top of that
  VM, and exports that machine to create an image. This is best if you have
  an existing VMware VM you want to use as the source. As an additional
  benefit, you can feed the artifact of this builder back into Packer to
  iterate on a machine.

### VMware Workstation Player on Linux

To use VMware Workstation Player with Packer on Linux, you will also need
the `qemu-img` command, which is available in the `qemu` package in
Red Hat Enterprise Linux, Debian, and derivative distributions.

Additionally you will need to have the `vmrun` command, which is part of the
VMware [Virtual Infrastructure eXtension][vix-api] [(VIX) SDK][vix-sdk].

Finally, you must edit the file `/usr/lib/vmware-vix/vixwrapper-config.txt`
and change the version specified in the fourth column to be the version in
the third column of the `vmplayer -v` command.
See [this StackOverflow thread][so] for more details.

[vix-api]: https://www.vmware.com/support/developer/vix-api/
[vix-sdk]: https://customerconnect.vmware.com/downloads/details?downloadGroup=PLAYER-1400-VIX1170&productId=687
[so]: https://stackoverflow.com/questions/31985348/vix-vmrun-doesnt-work-with-vmware-player
