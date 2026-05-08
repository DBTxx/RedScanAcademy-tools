# Tool-Work
By Dj3g0Tx

Script para varredura de rede e portas, desenvolvido para aula4 ReScanAcademy Turma-12
Permite realizar **PortScan** e **PingSweep** utilizando diferentes ferramentas (Hping3, Netcat e /dev/tcp).

---

## 📌 Modo de Uso
```bash
./script.sh <opção desejada>
```

Durante a execução, o script solicitará os parâmetros necessários (IP, faixa de portas, rede /24, etc.).  
Os resultados são exibidos na tela e também registrados no arquivo `toolwork.log`.

---

## ⚙️ Opções disponíveis

- **`-a` → PortScan com Hping3**  
  Realiza varredura de portas em um host específico usando **hping3**.  
  Solicita IP, porta inicial e porta final.  
  Exemplo:
  ```bash
  ./script.sh -a
  ```

- **`-b` → PingSweep com Hping3**  
  Varre uma rede /24 para identificar hosts ativos via ICMP.  
  Solicita o prefixo da rede (ex: `192.168.0`).  
  Exemplo:
  ```bash
  ./script.sh -b
  ```

- **`-c` → PortScan com Netcat (host único)**  
  Escaneia portas em um IP específico usando **netcat**.  
  Solicita IP, porta inicial e porta final.  
  Exemplo:
  ```bash
  ./script.sh -c
  ```

- **`-d` → PortScan com Netcat (rede /24)**  
  Verifica uma porta específica em todos os hosts de uma rede /24.  
  Solicita prefixo da rede e número da porta.  
  Exemplo:
  ```bash
  ./script.sh -d
  ```

- **`-e` → PingSweep com /dev/tcp**  
  Usa o recurso `/dev/tcp` do Bash para verificar hosts ativos em uma rede /24.  
  Solicita prefixo da rede e porta.  
  Exemplo:
  ```bash
  ./script.sh -e
  ```

- **`-f` → PortScan com /dev/tcp**  
  Escaneia uma faixa de portas em um host específico usando `/dev/tcp`.  
  Solicita IP, porta inicial e porta final.  
  Exemplo:
  ```bash
  ./script.sh -f
  ```

---

## 📝 Observações
- Os resultados são salvos em `toolwork.log` com data e hora.  
- O script utiliza **cores** para destacar mensagens de status.  
- É necessário ter privilégios de **root** para usar `hping3`.  
- O uso é **educacional**.  

---

## ⚠️ Aviso
Este script foi desenvolvido para fins acadêmicos e laboratoriais.  
Não deve ser utilizado em redes ou sistemas sem autorização explícita.
```

---
