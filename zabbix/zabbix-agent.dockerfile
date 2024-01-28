FROM zabbix/zabbix-agent:latest

COPY ./data_zabbix_agent/zabbix_agent_lab.conf /etc/zabbix/zabbix_agent.conf

