#!/bin/bash
gcsfuse -o nonempty -o allow_other --dir-mode 755 ${bucket} /mnt