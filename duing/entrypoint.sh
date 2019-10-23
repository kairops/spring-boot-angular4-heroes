#!/bin/bash
service ssh start
cat /dev/zero | ssh-keygen -q -N ""
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
echo "StrictHostKeyChecking no" > /root/.ssh/config
ssh -f -N -L 4200:app:4200 -L 8080:app:8080 localhost
/bin/bash /root/startup.sh
