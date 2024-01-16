#!/bin/bash
/usr/sbin/sshd -D &
/app/frpc -c /app/frpc.toml