resource "null_resource" "wp-packer" {
  provisioner "local-exec" {
    command = <<EOF
packer build \
  -var 'account_file'='$HOME/.config/gcloud/application_default_credentials.json' \
  -var 'priv-subnet=${var.subnet}' \
  -var 'project=${var.project}'\
  -var 'zone=${var.zone}'\
  -var 'image-name=${var.image-name}' \
  -var 'source-image=${var.source-image}' \
  -var 'username=${var.ssh-username}' \
  -var 'machine-type=${var.packer-machine-type}' \
  -var 'playbook=${var.playbook}' \
  -var 'ansible-extra-vars=${var.ansible-extra-vars}' \
 packer/packer.pkr.hcl
sleep 25
EOF
  }
}
