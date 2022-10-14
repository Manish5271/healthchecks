#!/bin/bash

Date=$(date +"%d_%m_%Y")

CIDLC=$(docker ps -qf name=console-v9)


path=$(pwd)

echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Health Checks of LC component" >> $path/lc_report_"$Date".txt

echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "*lc server system checks*" >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Date" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
date >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Uptime of the lc server" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
uptime -p >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Last reboot" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
last reboot >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Time Synced" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
timedatectl >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Disk Utilization" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
df -h >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Memory Utization" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
free -h >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Host file of lc server" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
cat /etc/hosts >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Ip of lc server" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
ifconfig >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Avilable CPU'S on lc server" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
lscpu >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Umask of / " >> $path/lc_report_"$Date".txt
cd / >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
umask >> $path/lc_report_"$Date".txt
cd $path/ >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Umask of /DNIF " >> $path/lc_report_"$Date".txt
cd /DNIF >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
umask >> $path/lc_report_"$Date".txt
cd $path/ >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt

echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "*Docker and compose logs*" >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Docker Container status" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
docker ps >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
cd /DNIF/LC
echo -e "Docker-compose file" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
cat docker-compose.yaml >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
echo -e "Docker Compose logs of lc" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
docker-compose logs >> $path/lc_report_"$Date".txt
cd $path/
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt

echo -e "*DNIF Services Status of LC*" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
docker exec "$CIDLC" supervisorctl status >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt

echo -e "*lc services logs*" >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "ad_user_sync.log" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
tail /DNIF/LC/log/ad_user_sync.log >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "api_service.log" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
tail /DNIF/LC/log/api_service.log >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "lc_worker.log" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
tail /DNIF/LC/log/lc_worker.log >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt

echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "*Network Checks of lc*" >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Firewall status">> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
ufw status >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Proxy Details" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
env | grep -i "proxy" >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt
echo -e "Ports on listing" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
netstat -aunpt | grep -i listen >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt

echo -e "*Ngnix service status*" >> $path/lc_report_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/lc_report_"$Date".txt
docker exec "$CIDLC" /etc/init.d/nginx status >> $path/lc_report_"$Date".txt
echo -e "==================================================================================================================" >> $path/lc_report_"$Date".txt

tar fcz  $path/lc_checks_"$Date".tar.gz --absolute-names $path/lc_report_"$Date".txt

rm -rf $path/lc_report_"$Date".txt