resource "null_resource" "wp-packer" {
  provisioner "local-exec" {
    command    = <<EOF
packer build \
 -var 'priv-subnet=${var.subnet}' \
 -var 'project=${var.project}'\
 -var 'zone=${var.zone}'\
 -var 'username=${var.ssh-username}' \
 -var 'image-name=${var.image-name}' \
 -var 'source-image=${var.source-image}' \
 -var 'machine-type=${var.packer-machine-type}' \
 -var 'playbook=${var.playbook}' \
 -var 'ansible-extra-vars=${var.ansible-extra-vars}' \
 packer/packer.pkr.hcl
sleep 5
EOF
    on_failure = continue
  }
}

resource "null_resource" "wp-packer-destroy" {
  triggers = {
    image = "${var.image-name}"
  }
  provisioner "local-exec" {
    when       = destroy
    command    = <<EOF
gcloud compute images delete ${self.triggers.image} -q \
EOF
    on_failure = continue
  }
}