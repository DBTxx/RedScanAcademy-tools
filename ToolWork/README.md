

cat > README.md << 'EOF'
# Tool-Work v0.1
By Dj3g0Tx

Script utilitário para varredura de rede e análise de portas, com múltiplas opções de execução.

## Modo de Uso
./ToolWork.sh <opção>

### Opções disponíveis
- -a PortScan - Hping3
- -b PingSweep - Hping3
- -c PortScan - Netcat
- -d PingSweep - Netcat
- -e PingSweep - /dev/tcp
- -f PortScan - /dev/tcp

## Requisitos
- Bash
- hping3
- netcat
- Permissões de execução (chmod +x ToolWork.sh)

## Observações
- Algumas opções exigem privilégios administrativos (sudo).
