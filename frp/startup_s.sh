#!/bin/bash
/usr/sbin/sshd -D &
/app/frps -c /app/frps.toml