#!/bin/bash
export BUCKET=${var.bucket}
gcsfuse -o nonempty -o allow_other --dir-mode 755 $BUCKET /mnt