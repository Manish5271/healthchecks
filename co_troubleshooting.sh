#!/bin/bash

Date=$(date +"%d.%m.%Y")

CIDCO=$(docker ps -qf name=core-v9)
CIDMDN=$(docker ps -qf name=datanode-master-v9)
CIDLC=$(docker ps -qf name=console-v9)
NAMELC=$(docker ps -a --format '{{.Names}}' | grep -w console-v9)

IP=$(cat /DNIF/CO/csltuconfig/system.yml | grep -i "localIPv4Address:" | awk '{print $2}')

path=$(pwd)

echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Health Checks of CO component" >> $path/co_report_"$IP"_"$Date".txt


echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "*co server system checks*" >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Date" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
date >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Uptime of the co server" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
uptime -p >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Last reboot" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
last reboot >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Time Synced" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
timedatectl >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Disk Utilization" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
df -h >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Memory Utization" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
free -h >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Host file of co server" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
cat /etc/hosts >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Ip of co server" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
ifconfig >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Avilable CPU'S on co server" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
lscpu >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Umask of / " >> $path/co_report_"$IP"_"$Date".txt
cd / >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
umask >> $path/co_report_"$IP"_"$Date".txt
cd $path/ >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Umask of /DNIF " >> $path/co_report_"$IP"_"$Date".txt
cd /DNIF >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
umask >> $path/co_report_"$IP"_"$Date".txt
cd $path/ >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt

echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "*Docker and compose logs*" >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Docker Container status" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
docker ps >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
cd /DNIF
echo -e "Docker-compose file" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
cat docker-compose.yaml >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Docker Compose logs of co" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
docker-compose logs >> $path/co_report_"$IP"_"$Date".txt
cd $path/
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt


if [ "$NAMELC" = "console-v9" ]; then
    echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "*Docker and compose logs of LC*" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "Docker Container status of LC" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
    docker ps >> $path/co_report_"$IP"_"$Date".txt
    echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
    cd /DNIF/LC
    echo -e "Docker-compose file" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
    cat docker-compose.yaml >> $path/co_report_"$IP"_"$Date".txt
    echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "Docker Compose logs of LC" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
    docker-compose logs >> $path/co_report_"$IP"_"$Date".txt
    cd $path/
    echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
fi

echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "*DNIF Services Status of CO*" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
docker exec "$CIDCO" supervisorctl status >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "*DNIF Services Status of MDN*" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
docker exec "$CIDMDN" supervisorctl status >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt

if [ "$NAMELC" = "console-v9" ]; then
    echo -e "*DNIF Services Status of LC*" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
    docker exec "$CIDLC" supervisorctl status >> $path/co_report_"$IP"_"$Date".txt
    echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
fi


echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "*Hadoop Service Status*" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
systemctl status hadoop-namenode.service | grep -i "Active" -B2 >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt



echo -e "*co services logs*" >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "api_service.log " >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/api_service.log  >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "auto_scheduler.log " >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/auto_scheduler.log  >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "celery_scheduler.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/celery_scheduler.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "cluster_api_service.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/cluster_api_service.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "compaction_monitor.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/compaction_monitor.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "core_worker.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/core_worker.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "cost_management.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/cost_management.log  >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "datalake_monitor.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/datalake_monitor.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "dispatcher_api_service.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/dispatcher_api_service.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "event_server.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/event_server.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "health_reporter.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/health_reporter.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e " notable_events.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/notable_events.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "robocop.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/robocop.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "sheepdog.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/sheepdog.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "signal_sync.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/signal_sync.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "supervisor_monitor.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/supervisor_monitor.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "worker_snapshot.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/CO/log/worker_snapshot.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt


echo -e "*mdn services logs*" >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "balancer.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/balancer.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "dn_monitor.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/dn_monitor.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "health_reporter.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/health_reporter.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "robocop.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/robocop.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "sheepdog.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/sheepdog.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "supervisor_monitor.log" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/supervisor_monitor.log >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt


if [ "$NAMELC" = "console-v9" ]; then
    echo -e "*lc services logs*" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "ad_user_sync.log" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
    tail /DNIF/LC/log/ad_user_sync.log >> $path/co_report_"$IP"_"$Date".txt
    echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "api_service.log" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
    tail /DNIF/LC/log/api_service.log >> $path/co_report_"$IP"_"$Date".txt
    echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "lc_worker.log" >> $path/co_report_"$IP"_"$Date".txt
    echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
    tail /DNIF/LC/log/lc_worker.log >> $path/co_report_"$IP"_"$Date".txt
    echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt    
fi

echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "*Network Checks of co*" >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Firewall status">> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
ufw status >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Proxy Details" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
env | grep -i "proxy" >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt
echo -e "Ports on listing" >> $path/co_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/co_report_"$IP"_"$Date".txt
netstat -aunpt | grep -i listen >> $path/co_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/co_report_"$IP"_"$Date".txt

#functions for advanced checks

hadoopdnfailed()
{
	tar czf $path/co_hadoop_logs_"$IP"_"$Date".tar.gz --absolute-names /opt/hadoop-3.2.3/logs/
}

hdfailed=$(systemctl status hadoop-namenode.service| grep -i "failed" | awk '{print $2}' | grep -i "failed")

if [ "$hdfailed" = "failed" ]; then 
	hadoopdnfailed
fi

if [ "$hdfailed" = "failed" ]; then 
	tar fcz  $path/co_checks_"$IP"_"$Date".tar.gz --absolute-names $path/co_hadoop_logs_"$IP"_"$Date".tar.gz $path/co_report_"$IP"_"$Date".txt
    rm -rf $path/co_hadoop_logs_"$IP"_"$Date".tar.gz $path/co_report_"$IP"_"$Date".txt
else
    tar fcz  $path/co_checks_"$IP"_"$Date".tar.gz --absolute-names $path/co_report_"$IP"_"$Date".txt
    rm -rf $path/co_report_"$IP"_"$Date".txt
fi
