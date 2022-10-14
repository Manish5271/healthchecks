#!/bin/bash

Date=$(date +"%d.%m.%Y")

CID=$(docker ps -qf name=datanode-v9)

IP=$(cat /DNIF/DL/csltuconfig/system.yml | grep -i "localIPv4Address:" | awk '{print $2}')

path=$(pwd)

echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Health Checks of dn component" >> $path/dn_report_"$IP"_"$Date".txt


echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "*dn server system checks*" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Date" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
date >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Uptime of the dn server" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
uptime -p >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Last reboot" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
last reboot >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Time Synced" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
timedatectl >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Disk Utilization" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
df -h >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Memory Utization" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
free -h >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Host file of dn server" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
cat /etc/hosts >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Ip of dn server" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
ifconfig >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Avilable CPU'S on dn server" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
lscpu >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Umask of / " >> $path/dn_report_"$IP"_"$Date".txt
cd / >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
umask >> $path/dn_report_"$IP"_"$Date".txt
cd $path/ >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Umask of /DNIF " >> $path/dn_report_"$IP"_"$Date".txt
cd /DNIF >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
umask >> $path/dn_report_"$IP"_"$Date".txt
cd $path/ >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt

echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "*Docker and compose logs*" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Docker Container status" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
docker ps >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
cd /DNIF/DL
echo -e "Docker-compose file" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
cat docker-compose.yaml >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Docker Compose logs of dn" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
docker-compose logs >> $path/dn_report_"$IP"_"$Date".txt
cd $path/
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt


echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "*DNIF Services Status*" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
docker exec "$CID" supervisorctl status >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt


echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "*Spark Services Status*" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
systemctl status spark-slave.service | grep -i "Active" -B2 >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
systemctl status spark-master.service | grep -i "Active" -B2>> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt

echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "*Hadoop Service Status*" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
systemctl status hadoop-datanode.service | grep -i "Active" -B2 >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt

echo -e "*dn services logs*" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "celery_worker_analytics_01.log" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/celery_worker_analytics_01.log >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "celery_worker_interactive_01.log" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/celery_worker_interactive_01.log >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "celery_worker_reports_01.log" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/celery_worker_reports_01.log >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "health_reporter.log" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/health_reporter.log >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "compaction_worker_01.log" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/compaction_worker_01.log >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "dn_monitor.log" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/dn_monitor.log >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "robocop.log" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/robocop.log >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "sheepdog.log" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/sheepdog.log >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "supervisor_monitor.log" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
tail /DNIF/DL/log/supervisor_monitor.log >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt

echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "*Network Checks of dn*" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Firewall status">> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
ufw status >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Proxy Details" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
env | grep -i "proxy" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "Ports on listing" >> $path/dn_report_"$IP"_"$Date".txt
echo -e "------------------------------------------------------------------------------------------------------------------" >> $path/dn_report_"$IP"_"$Date".txt
netstat -aunpt | grep -i listen >> $path/dn_report_"$IP"_"$Date".txt
echo -e "==================================================================================================================" >> $path/dn_report_"$IP"_"$Date".txt

#functions for advanced checks

spslfailed()
{
  	tar czf $path/dn_spark_logs_"$IP"_"$Date".tar.gz --absolute-names /opt/spark-3.1.3-bin-hadoop3.2/logs/ 
}


spmafailed()
{
	tar czf $path/dn_spark_logs_"$IP"_"$Date".tar.gz --absolute-names /opt/spark-3.1.3-bin-hadoop3.2/logs/ 
}


hadoopdnfailed()
{
	tar czf $path/dn_hadoop_logs_"$IP"_"$Date".tar.gz --absolute-names /opt/hadoop-3.2.3/logs/
}

ssfailed=$(systemctl status spark-slave.service | grep -i "failed" | awk '{print $2}' | grep -i "failed")

smfailed=$(systemctl status spark-master.service | grep -i "failed" | awk '{print $2}' | grep -i "failed")

hdfailed=$(systemctl status hadoop-datanode.service| grep -i "failed" | awk '{print $2}' | grep -i "failed")

if [ "$ssfailed" = "failed" ]; then 
	spslfailed
fi


if [ "$smfailed" = "failed" ]; then 
	spmafailed
fi


if [ "$hdfailed" = "failed" ]; then 
	hadoopdnfailed
fi


if [ "$ssfailed" = "failed" ]; then 
    tar fcz $path/dn_checks_"$IP"_"$Date".tar.gz --absolute-names $path/dn_spark_logs_"$IP"_"$Date".tar.gz $path/dn_report_"$IP"_"$Date".txt
    rm -rf $path/dn_spark_logs_"$IP"_"$Date".tar.gz $path/dn_report_"$IP"_"$Date".txt
fi


if [ "$smfailed" = "failed" ]; then 
	tar fcz  $path/dn_checks_"$IP"_"$Date".tar.gz --absolute-names $path/dn_spark_logs_"$IP"_"$Date".tar.gz $path/dn_report_"$IP"_"$Date".txt
    rm -rf $path/dn_spark_logs_"$IP"_"$Date".tar.gz $path/dn_report_"$IP"_"$Date".txt
fi


if [ "$hdfailed" = "failed" ]; then 
	tar fcz  $path/dn_checks_"$IP"_"$Date".tar.gz --absolute-names $path/dn_hadoop_logs_"$IP"_"$Date".tar.gz $path/dn_report_"$IP"_"$Date".txt
    rm -rf $path/dn_hadoop_logs_"$IP"_"$Date".tar.gz $path/dn_report_"$IP"_"$Date".txt
else
    tar fcz  $path/dn_checks_"$IP"_"$Date".tar.gz --absolute-names $path/dn_report_"$IP"_"$Date".txt
    rm -rf $path/dn_report_"$IP"_"$Date".txt
fi

