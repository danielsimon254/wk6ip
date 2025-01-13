provider "virtualbox" {}

resource "virtualbox_vm" "backend_server" {
  count      = var.vm_count
  name       = var.vm_name
  image      = "ubuntu/focal64" 
  memory     = var.vm_memory
  cpus       = var.vm_cpu
  vram       = 16
  network_adapter {
    type = "virtio"
  }
  ssh_username = "vagrant"
  ssh_private_key = "${file("~/.vagrant.d/insecure_private_key")}"

  provisioner "file" {
    source      = "./init.sh"
    destination = "/tmp/init.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/init.sh",
      "sudo /tmp/init.sh"
    ]
  }

  # Customize the VM if needed
  tags = {
    Name = var.vm_name
  }
}

output "vm_ips" {
  value = virtualbox_vm.backend_server.*.primary_ip_address
}
