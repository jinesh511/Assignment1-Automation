resource "null_resource" "linux_provisioner" {
  count = var.nb_count
  depends_on = [
    azurerm_linux_virtual_machine.vm
  ]

  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]

    on_failure = continue

    connection {
      type     = "ssh"
      user     = var.username
      password = var.passowrd
      host     = element(azurerm_linux_virtual_machine.vm[*].public_ip_address, count.index + 1)
    }
  }
}