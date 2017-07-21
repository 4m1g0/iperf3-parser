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
filenameUdp="results/$1_$(date +"%F_%R")_udp.json"
iperf3 -c $IP -u -b 1G -V -R -J -t 300 --logfile "$filenameUdp"
if [ $? -ne 0 ]
then
    echo "ERROR: There was an error during the execution of iperf. Please check the result file in: $filenameUdp"
    exit
fi
echo "Finalizado."

echo "[2/2] Iniciando prueba de TCP..."
filenameTcp="results/$1_$(date +"%F_%R")_tcp.json"
iperf3 -c $IP -V -R -J -t 300 --logfile "$filenameTcp"
if [ $? -ne 0 ]
then
    echo "ERROR: There was an error during the execution of iperf. Please check the result file in: $filenameTcp"
    exit
fi
echo "Finalizado :D"
date
echo "Generando informe..."
./generateAll.sh template.html "$filenameTcp $filenameUdp"
evince report.pdf
