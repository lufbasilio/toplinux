#!/usr/bin/env bash
#
# TopLinux - Verifica as distribuições Linux mais populares.
#
# Autor:      Lucas Ferreira Basilio
#
# ------------------------------------------------------------------------ #
#  Este programa irá mostrar as distribuições linux mais populares nos últimos
#12 meses.
#
#  Exemplo de uso:
#      $ ./toplinux -n 32
#      Neste exemplo o script mostrará as 32 distribuições mais usadas.
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 30/04/2022, Lucas:
#       - Início do programa
# ------------------------------------------------------------------------ #
# Testado em:
#   GNU bash, versão 5.1.8(1)-release (x86_64-pc-linux-gnu)
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
QUANTIDADE='271'
DISTROS='/tmp/distros.txt'
VERMELHO='\033[31;1m'
VERDE='\033[32;1m'
NUMBER=0
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! $(which curl) ] && sudo apt-get install curl -y
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
while [ $QUANTIDADE -gt 200 ]; do
    echo "Informe quantas distribuições deseja listar (1 a 200)"
    read QUANTIDADE 
done

curl -s https://distrowatch.com/dwres.php?resource=popularity | grep phr2 | head -n $QUANTIDADE | sed 's/<td.*">// ; s/<\/a>.*//' > /tmp/distros.txt

echo -e "$VERDE TOP $QUANTIDADE DISTROS POPULARES:"
while read -r line; do
    NUMBER=$(($NUMBER+1))
    echo -e "$VERMELHO      $NUMBER-$line"
done < "$DISTROS"
# ------------------------------------------------------------------------ #