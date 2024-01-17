#!/bin/bash
export HN_=$(hostname)
/usr/sbin/sshd -D &
/app/frpc -c /app/frpc.toml