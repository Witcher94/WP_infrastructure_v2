wp-playbook         = "ansible/wp-playbook.yml"
source-image        = "ubuntu-2004-focal-v20220419"
image-name          = "configured-ubuntu-image"
playbook            = "ansible/wp-deploy.yml"
packer-machine-type = "e2-medium"
account_file        = "private-key.json"
role_entity = [
  "OWNER: pfaka@softserveinc.com",
  "READER: pavlo.fakas@gmail.com"
]
storage_class = "STANDARD"