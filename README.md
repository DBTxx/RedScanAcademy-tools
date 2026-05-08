# RedScanAcademy - Turma 12
By Dj3g0Tx

Repositório com scripts desenvolvidos durante as aulas da **RedScanAcademy**, focados em análise de logs, varredura de rede e segurança ofensiva.  


---

## 📌 Scripts disponíveis

### 🔹 RedScan3-1
Ferramenta para análise de **logs de acesso web**, com foco em identificar indícios de ataques.  
- Detecta XSS, SQL Injection, Directory Traversal  
- Identifica scanners e acessos a arquivos sensíveis  
- Mostra primeiro/último acesso de um IP  
- Lista IPs e quantidade de requisições  
- Registra tentativas de força bruta e acessos bem-sucedidos a arquivos críticos  

👉 [Leia mais sobre o RedScan3-1](./RedScan3-1/README.md)

---

### 🔹 Tool-Work
Script para **varredura de rede e portas**, utilizando diferentes técnicas e ferramentas.  
- PortScan com Hping3, Netcat e /dev/tcp  
- PingSweep com Hping3 e /dev/tcp  
- Resultados salvos em `toolwork.log` com data/hora  

👉 [Leia mais sobre o Tool-Work](./Tool-Work/README.md)

---

## ⚠️ Aviso Importante
Todos os scripts aqui presentes foram desenvolvidos para **aprendizado em segurança da informação**.  
Não devem ser utilizados em redes ou sistemas sem autorização explícita.  
O uso indevido pode configurar crime digital.

---

## 🛠️ Requisitos
- Linux (Debian/Kali recomendado)  
- Bash  
- Ferramentas auxiliares: `hping3`, `netcat`, `grep`, `awk`, `sed`, `timeout`  
- Acesso a arquivos de log (ex: `access.log` do Apache/Nginx)

---

## 📖 Objetivo
Este repositório serve como material de estudo e prática para alunos da **RedScanAcademy Turma 12**, reforçando conceitos de:
- Análise de logs
- Reconhecimento de ataques web
- Varredura de rede e portas
- Segurança ofensiva e defensiva
