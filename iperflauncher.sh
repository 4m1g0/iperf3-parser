#!/bin/bash

if [ "$#" -lt 1 ]
then
    echo "IperfLauncher"
    echo "No enough arguments."
    echo "Run $0 name_of_the_test"
    exit
fi
if [ "x" = "x$IP" ]
then
    echo "IperfLauncher"
    echo "Set the enviroment variable: IP to the ip of the remote host."
    exit
fi
date
echo "[1/2] Iniciando prueba de UDP..."
iperf3 -c $IP -u -b 1G -V -R -J -t 300 --logfile "results/$1_$(date +"%F_%R")_udp.json"
if [ $? -ne 0 ]
then
    echo "ERROR: There was an error during the execution of iperf. Please check the result file in: results/$1_$(date +"%F_%R")_udp.json"
    exit
fi
echo "Finalizado."

echo "[2/2] Iniciando prueba de TCP..."
iperf3 -c $IP -V -R -J -t 300 --logfile "results/$1_$(date +"%F_%R")_tcp.json"
if [ $? -ne 0 ]
then
    echo "ERROR: There was an error during the execution of iperf. Please check the result file in: results/$1_$(date +"%F_%R")_udp.json"
    exit
fi
echo "Finalizado :D"
date

