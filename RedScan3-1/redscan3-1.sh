#!/bin/bash

banner()
{
      echo "Use: ./script.sh <Opcao> <Arquivo de log>"
      echo "Ex: ./redscan3-1.sh -a access.log"
      echo ""
      echo "OPCOES DE USO"
      echo "-a - Detectar possíveis ataques de XSS (Cross-Site Scripting)"
      echo "-b - Detectar tentativas de SQL Injection"
      echo "-c - Detectar varredura de diretórios (Directory Traversal)"
      echo "-d - Detectar possíveis ataques por scanners (User-Agent suspeito)"
      echo "-e - Identificar tentativas de acesso a arquivos sensíveis"
      echo "-f - Detectar possíveis ataques de força bruta a arquivos/pastas"
      echo "-g - Primeiro e ultimo acesso de um IP suspeito."
      echo "-h - Localizar user-agent utilizado por um IP suspeito"
      echo "-i - Listar os ips e verificar quantidade de requisições"
      echo "-j - Localizar acesso a um determinado arquivo sensível"
      echo " =====IMPORTANTE===== "
      echo "Passar o IP para as opcões -g e -h"
      echo "Ex:./redscan3-1.sh <OPCÃO> <IP> <ARQUIVO_DE_LOG>"
      echo ""

}

banner2()
{
  echo "Tool-Work  - version 0.1"
  echo "By Dj3g0Tx"
}
# Checagem inicial: precisa ter pelo menos 2 argumentos
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Erro: você precisa passar a opção e o arquivo de log."
    banner
    banner2
    exit 1
  fi

if [ "${1}" = "-a" ]
then
    echo "Detectando XSS... digite o caminho do log"
    #read access
    grep -iE "(<script[^>]*>.*</script>|%3Cscript.*%3E.*%3C/script%3E|&#x3C;script.*&#x3E.*&#x3C;/script&#x3E|&lt;script.*&gt;.*&lt;/script&gt;)" ${2}
    echo "IPs envolvidos:"
    grep -iE "(<script[^>]*>.*</script>|%3Cscript.*%3E.*%3C/script%3E|&#x3C;script.*&#x3E.*&#x3C;/script&#x3E|&lt;script.*&gt;.*&lt;/script&gt;)" ${2} | cut -d " " -f1 | sort | uniq -c

elif [ "${1}" = "-b" ]
then
    echo "Detectando SQL Injection .."
    grep -iE "(union(\s+all)?\s+select|select\s+.*from|insert\s+into|update\s+.*set|delete\s+from|drop\s+(table|database)|--|#|/\*|%27|%22|%23|%2D%2D|%2F\*|or\s+1=1|and\s+1=1)" ${2}
    echo "IPs envolvidos:"
    grep -iE "(union(\s+all)?\s+select|select\s+.*from|insert\s+into|update\s+.*set|delete\s+from|drop\s+(table|database)|--|#|/\*|%27|%22|%23|%2D%2D|%2F\*|or\s+1=1|and\s+1=1)" ${2} | cut -d " " -f1 | sort | uniq -c

elif [ "${1}" = "-c" ]
then
    echo "Detectando varredura de diretórios (Directory Traversal)..."
    grep -iE "(\.\./|\.\.\\|%2f|%2F|%5c|%252f|%255c)" ${2}
    echo "IPs envolvidos:"
    grep -iE "(\.\./|\.\.\\|%2f|%2F|%5c|%252f|%255c)" ${2} | cut -d " " -f1 | sort | uniq -c

elif [ "${1}" = "-d" ]
then
    echo "Detectar possíveis ataques por scanners (User-Agent suspeito)..."
    grep -iE "(nikto|nmap|sqlmap|acunetix|curl|masscan|python|wpscan|dirbuster|fimap|hydra|john|metasploit|nessus|openvas|burpsuite|owasp|arachni|zaproxy)" ${2}
    echo "IPs envolvidos:"
    grep -iE "(nikto|nmap|sqlmap|acunetix|curl|masscan|python|wpscan|dirbuster|fimap|hydra|john|metasploit|nessus|openvas|burpsuite|owasp|arachni|zaproxy)" ${2} | cut -d " " -f1 | sort | uniq -c

elif [ "${1}" = "-e" ]
then
    echo "Identificar tentativas de acesso a arquivos sensíveis..."
    grep -iE "(\.env|\.git|\.htaccess|\.bak|\.DS_Store|\.svn|\.hg|\.config|\.ini|\.log|\.backup|\.old|\.swp|\.tar|\.zip|\.gz)" ${2}
    echo "IPs envolvidos:"
    grep -iE "(\.env|\.git|\.htaccess|\.bak|\.DS_Store|\.svn|\.hg|\.config|\.ini|\.log|\.backup|\.old|\.swp|\.tar|\.zip|\.gz)" ${2} | cut -d " " -f1 | sort | uniq -c


elif [ "${1}" = "-f" ]
then
      echo "Detectar possíveis ataques de força bruta a arquivos/pastas"
      grep -iE " 404 .*(admin|login|wp-|config|backup|\.env|\.git|\.htaccess|\.bak|\.zip|\.tar|\.gz)" ${2}
      echo "IPs envolvidos:"
      grep -iE " 404 .*(admin|login|wp-|config|backup|\.env|\.git|\.htaccess|\.bak|\.zip|\.tar|\.gz)" ${2} | cut -d " " -f 1 | sort | uniq -c | sort -n -r | head

elif [ "${1}" = "-g" ]
then
    if [ -z "$2" ] || [ -z "$3" ]; then
        echo "Uso correto: ./script.sh -g <IP> <arquivo.log>"
        exit 1
    fi

    IP=$2
    FILE=$3
    echo "Primeiro e último acesso do IP $IP no arquivo $FILE"
    grep "$IP" "$FILE" | head -n1
    grep "$IP" "$FILE" | tail -n1



elif [ "${1}" = "-h" ]
then
    if [ -z "$2" ] || [ -z "$3" ]; then
        echo "Uso correto: ./script.sh -h <IP> <arquivo.log>"
        exit 1
    fi

    IP=$2
    FILE=$3
    echo "User-Agent utilizado pelo IP $IP:"
    grep "$IP" "$FILE" | cut -d '"' -f6 | sort | uniq -c | sort -nr

elif [ "${1}" == "-i" ]
then
      echo "Listar os ips e verificar o numero de requisições"
      echo "IPs envolvidos:"
      cat ${2} | cut -d " " -f 1 | sort | uniq -c

elif [ "${1}" == "-j" ]
then
      echo "Localizar acesso a um determinado arquivo sensível"
      grep -iE "passwords.* 200" ${2}
      echo "IPs Envolvidos:"
      grep -iE "passwords.* 200" ${2} | cut -d " " -f1 | sort | uniq -c
else
    banner
fi
