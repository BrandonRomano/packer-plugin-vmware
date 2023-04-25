# For full specification on the configuration of this file visit:
# https://github.com/hashicorp/integration-template#metadata-configuration
integration {
  name = "VMware"
  description = "The Packer Plugin for VMware is a multi-component plugin that can be used with Packer to create virtual machine images for use with VMware products."
  identifier = "packer/BrandonRomano/vmware"
  component {
    type = "builder"
    name = "VMware ISO"
    slug = "iso"
  }
  component {
    type = "builder"
    name = "VMware VMX"
    slug = "vmx"
  }
}
