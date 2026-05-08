#!/bin/bash
trap "echo -e '\n\033[1;31m[!] Interrompido pelo usuário.\033[0m'; exit" SIGINT

LOG="toolwork.log"

banner()
{
   echo -e "\033[1;34m==============================\033[0m"
   echo -e "\033[1;36mModo de Uso\033[0m"
   echo "./script.sh <opção desejada>"
   echo ""
   echo " -a  -> PortScan - Hping3"
   echo " -b  -> PingSweep - Hping3"
   echo " -c  -> PortScan - Netcat"
   echo " -d  -> PortScan - Netcat"
   echo " -e  -> PingSweep - /dev/tcp"
   echo " -f  -> PortScan - /dev/tcp"
   echo -e "\033[1;34m==============================\033[0m"
}

banner2()
{
  echo -e "\033[1;32m====================================\033[0m"
  echo -e "\033[1;32m Tool-Work  - version 0.1 \033[0m"
  echo -e "\033[1;33m By Dj3g0Tx \033[0m"
  echo -e "\033[1;32m====================================\033[0m"
}
banner2

log_result() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG
}

if [ "${1}" = "-a" ]
then
    echo -e "\033[1;36m[+] PortScan - Hping3\033[0m"
    echo "Digite o IP"
    read IP
    echo "Digite a porta inicial"
    read porti
    echo "Digite a porta final"
    read portf
    echo -e "\033[1;34m[>] Executando scan em $IP ($porti-$portf)...\033[0m"
    sudo hping3 $IP -S --scan "$porti-$portf" | tee -a $LOG
    echo -e "\033[1;32m[✓] Scan concluído!\033[0m"

elif [ "${1}" = "-b" ]
then
    echo -e "\033[1;36m[+] PingSweep - Hping3\033[0m"
    echo "Digite IP da Rede - Ex: 192.168.0"
    read ip
    echo -e "\033[1;34m[>] Varredura iniciada em $ip.0/24...\033[0m"
    for i in $(seq 1 254);do
        if [ -n "$(sudo hping3 -1 -c 1 $ip.$i 2>/dev/null | grep 'ttl')" ]; then 
            echo -e "\033[1;32mHost ativo:\033[0m $ip.$i"
            log_result "Host ativo: $ip.$i"
        fi
    done
    echo -e "\033[1;32m[✓] Varredura concluída!\033[0m"

elif [ "${1}" = "-c" ]
then
    echo -e "\033[1;36m[+] PortScan - Netcat\033[0m"
    echo "Digite o IP - Ex: 192.168.0.1"
    read ip
    echo "Digite a porta inicial - Ex: 1"
    read portai
    echo "Digite a porta final - Ex: 6500"
    read portaf
    echo -e "\033[1;34m[>] Executando scan em $ip ($portai-$portaf)...\033[0m"
    nc -v -n -z $ip $portai-$portaf | tee -a $LOG
    echo -e "\033[1;32m[✓] Scan concluído!\033[0m"

elif [ "${1}" = "-d" ]
then
    echo -e "\033[1;36m[+] PortScan - Netcat\033[0m"
    echo "Digite uma Rede/24 - Ex: 192.168.0"
    read ip
    echo "Digite uma porta - Ex: 80"
    read porta
    echo -e "\033[1;34m[>] Varredura iniciada em $ip.0/24 na porta $porta...\033[0m"
    for i in $(seq 1 254); do
        nc -zvw 1 $ip.$i $porta 2>/dev/null && echo -e "\033[1;32mHost $ip.$i - $porta up\033[0m" | tee -a $LOG
    done
    echo -e "\033[1;32m[✓] Varredura concluída!\033[0m"

elif [ "${1}" = "-e" ]
then
    echo -e "\033[1;36m[+] PingSweep - /dev/tcp\033[0m"
    echo "Digite uma Rede/24 - Ex: 192.168.0"
    read ip
    echo "Digite uma porta - Ex: 80"
    read porta
    echo -e "\033[1;34m[>] Varredura iniciada em $ip.0/24 na porta $porta...\033[0m"
    for i in $(seq 1 254); do 
        timeout 0.5 echo -n 2>/dev/null < "/dev/tcp/$ip.$i/$porta" && echo -e "\033[1;32mHost: $ip.$i ativo\033[0m" | tee -a $LOG
    done
    echo -e "\033[1;32m[✓] Varredura concluída!\033[0m"

elif [ "${1}" = "-f" ]
then
    echo -e "\033[1;36m[+] PortScan - /dev/tcp\033[0m"
    echo "Digite o IP - Ex: 192.168.0.1"
    read ip
    echo "Digite a porta inicial - Ex: 1"
    read portai
    echo "Digite a porta final - Ex: 6500"
    read portaf
    echo -e "\033[1;34m[>] Executando scan em $ip ($portai-$portaf)...\033[0m"
    for i in $(seq $portai $portaf); do 
        timeout 0.5 echo -n 2>/dev/null < "/dev/tcp/$ip/$i" && echo -e "\033[1;32mPorta $i aberta\033[0m" | tee -a $LOG
    done
    echo -e "\033[1;32m[✓] Scan concluído!\033[0m"

else
    banner
fi
