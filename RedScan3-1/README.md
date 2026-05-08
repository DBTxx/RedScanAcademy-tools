# RedScan3-1
By Dj3g0Tx

Script para análise de logs de acesso, com foco em identificar indícios de ataques web, desenvolvido na aula3, RedScanAcademy Turma-12

## Modo de Uso

./redscan3-1.sh <opção> <ARQUIVO_DE_LOG>

 ======IMPORTANTE======
Para as opções -g e -h, é necessário passar também o IP suspeito.
Exemplo:
./redscan3-1.sh -g 192.168.0.10 <ARQUIVO_DE_LOG>
./redscan3-1.sh -h 192.168.0.10 <ARQUIVO_DE_LOG>

===Opções disponíveis===
-a Detectar XSS (Cross-Site Scripting)  
Busca padrões de <script> e codificações suspeitas no log.
Exemplo: ./redscan3-1.sh -a <ARQUIVO_DE_LOG>

-b Detectar SQL Injection  
Identifica tentativas de injeção SQL.
Exemplo:./redscan3-1.sh -b <ARQUIVO_DE_LOG>

-c Detectar Directory Traversal  
Procura acessos com ../ e variações codificadas.
Exemplo: ./redscan3-1.sh -c <ARQUIVO_DE_LOG>

-d Detectar scanners (User-Agent suspeito)  
Localiza acessos feitos por ferramentas como nmap, sqlmap, nikto, etc.
Exemplo: ./redscan3-1.sh -d <ARQUIVO_DE_LOG>

-e Acesso a arquivos sensíveis  
Identifica tentativas de acesso a .env, .git, .htaccess, backups, etc.
Exemplo:./redscan3-1.sh -e <ARQUIVO_DE_LOG>

-f Força bruta em arquivos/pastas  
Detecta múltiplos erros 404 em áreas críticas (admin, login, wp-, etc).
Exemplo: ./redscan3-1.sh -f <ARQUIVO_DE_LOG>

-g Primeiro e último acesso de um IP  
Mostra o primeiro e último registro de um IP específico.
Exemplo: ./redscan3-1.sh -g 192.168.0.10 <ARQUIVO_DE_LOG>

-h User-Agent de um IP suspeito  
Lista os User-Agents usados por um IP.
Exemplo: ./redscan3-1.sh -h 192.168.0.10 <ARQUIVO_DE_LOG>

-i Listar IPs e quantidade de requisições  
Conta quantas vezes cada IP aparece no log.
Exemplo:./redscan3-1.sh -i <ARQUIVO_DE_LOG>

-j Acesso a arquivos sensíveis específicos  
Localiza acessos bem-sucedidos (HTTP 200) a arquivos como passwords.
Exemplo: ./redscan3-1.sh -j <ARQUIVO_DE_LOG>
Requisitos:
Bash
Arquivos de log de acesso (ex: access.log do Apache, Nginx, outro)




