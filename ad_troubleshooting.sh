#!/bin/bash

Date=$(date +"%d.%m.%Y")

IP=$(cat /DNIF/AD/csltuconfig/system.yml | grep -i "localIPv4Address:" | awk '{print $2}')

path=$(pwd)

CID=$(docker ps -qf name=adapter-v9)
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Health Checks of AD component" >> $path/ad_report_"$IP"_"$Date".txt

echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "*AD server system checks*" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Date" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
date >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Uptime of the AD server" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
uptime -p >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Last reboot" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
last reboot >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Time Synced" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
timedatectl >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Disk Utilization" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
df -h >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Memory Utization" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
free -h >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Host file of AD server" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
cat /etc/hosts >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Ip of AD server" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
ifconfig >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Avilable CPU'S on AD server" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
lscpu >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Umask of / " >> $path/ad_report_"$IP"_"$Date".txt
cd / >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
umask >> $path/ad_report_"$IP"_"$Date".txt
cd $path/ >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Umask of /DNIF " >> $path/ad_report_"$IP"_"$Date".txt
cd /DNIF >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
umask >> $path/ad_report_"$IP"_"$Date".txt
cd $path/ >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "*Docker and compose logs*" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Docker Container status" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
docker ps >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
cd /DNIF/AD
echo -e "Docker-compose file" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
cat docker-compose.yaml >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Docker Compose logs of AD" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
docker-compose logs >> $path/ad_report_"$IP"_"$Date".txt
cd $path/
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Queueing Status" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Queue of the AD" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
docker exec "$CID" rabbitmqctl list_queues --node rabbit@dnif >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "*DNIF Services Status*" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
docker exec "$CID" supervisorctl status >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "*AD services logs*" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "dfs put log" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
tail /DNIF/AD/log/dfs_put.log >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "enrich_process.log" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
tail /DNIF/AD/log/enrich_process.log >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "eps-governor.log" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
tail /DNIF/AD/log/eps-governor.log >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "health_reporter.log" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
tail /DNIF/AD/log/health_reporter.log >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "indexer_process.log" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
tail /DNIF/AD/log/indexer_process.log >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "log_consumer.log" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
tail /DNIF/AD/log/log_consumer.log >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "parser_process.log" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
tail /DNIF/AD/log/parser_process.log >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "robocop.log" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
tail /DNIF/AD/log/robocop.log >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "sheepdog.log" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
tail /DNIF/AD/log/sheepdog.log >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "supervisor_monitor.log" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
tail /DNIF/AD/log/supervisor_monitor.log >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "*Network Checks of AD*" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Firewall status">> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
ufw status >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Proxy Details" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
env | grep -i "proxy" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Connevity between AD to CO" >> $path/ad_report_"$IP"_"$Date".txt
ip_ad=$(cat /DNIF/AD/csltuconfig/NameNode ) 
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
nc -z -v "$ip_ad" 9000 &>> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "Ports on listing" >> $path/ad_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/ad_report_"$IP"_"$Date".txt
netstat -aunpt | grep -i listen >> $path/ad_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/ad_report_"$IP"_"$Date".txt

tar fcz  $path/ad_checks_"$IP"_"$Date".tar.gz --absolute-names $path/ad_report_"$IP"_"$Date".txt

rm -rf $path/ad_report_"$IP"_"$Date".txt