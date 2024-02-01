FROM zabbix/zabbix-server-pgsql:latest

COPY ./data_zabbix_server/zabbix_server.conf /etc/zabbix/zabbix_server.conf
