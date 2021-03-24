#!/bin/bash
#16/03/2021
declare -A cor=( [0]="\033[1;37m" [1]="\033[1;34m" [2]="\033[1;31m" [3]="\033[1;33m" [4]="\033[1;32m" )
SCPfrm="/etc/ger-frm" && [[ ! -d ${SCPfrm} ]] && exit
SCPinst="/etc/ger-inst" && [[ ! -d ${SCPinst} ]] && exit
intallv2ray () {
apt install python3-pip -y 
source <(curl -sL https://multi.netlify.app/v2ray.sh)
msg -ama "$(fun_trans "Intalado con Exito")!"
}
protocolv2ray () {
msg -ama "$(fun_trans "Escojer opcion 3 y poner el dominio de nuestra IP")!"
msg -bar
v2ray stream
}
tls () {
msg -ama "$(fun_trans "Activar o Desactivar TLS")!"
msg -bar
echo -ne "\033[1;97mTip elige opcion -1.open TLS- y eliges la opcion 1 para\ngenerar los certificados automaticamente y seguir los pasos\nsi te marca algun error esocjer la opcion 1 de nuevo pero\nahora elegir opcion 2 para gregar las rutas del certificado\nmanualmente.\n\033[1;93m
certificado = /root/cer.crt\nkey= /root/key.key\n\033[1;97m"
openssl genrsa -out key.key 2048 > /dev/null 2>&1
(echo ; echo ; echo ; echo ; echo ; echo ; echo ) | openssl req -new -key key.key -x509 -days 1000 -out cer.crt > /dev/null 2>&1
echo ""
v2ray tls
}
unistallv2 () {
source <(curl -sL https://multi.netlify.app/v2ray.sh) --remove
}
infocuenta () {
v2ray info
}
port () {
v2ray port
}
addusr () {
clear 
clear
msg -bar
msg -tit
msg -ama "             AGREGAR USUARIO | UUID V2RAY"
msg -bar
##DAIS
valid=$(date '+%C%y-%m-%d' -d " +31 days")		  
##CORREO		  
MAILITO=$(cat /dev/urandom | tr -dc '[:alnum:]' | head -c 10)
##ADDUSERV2RAY		  
UUID=`uuidgen`	  
sed -i '13i\           \{' /etc/v2ray/config.json
sed -i '14i\           \"alterId": 0,' /etc/v2ray/config.json
sed -i '15i\           \"id": "'$UUID'",' /etc/v2ray/config.json
sed -i '16i\           \"email": "'$MAILITO'@gmail.com"' /etc/v2ray/config.json
sed -i '17i\           \},' /etc/v2ray/config.json
echo ""
while true; do
echo -ne "\e[91m >> Digita un Nombre: \033[1;92m"
     read -p ": " nick
     nick="$(echo $nick|sed -e 's/[^a-z0-9 -]//ig')"
     if [[ -z $nick ]]; then
     err_fun 17 && continue
     elif [[ "${#nick}" -lt "2" ]]; then
     err_fun 2 && continue
     elif [[ "${#nick}" -gt "5" ]]; then
     err_fun 3 && continue
     fi
     break
done
echo -e "\e[91m >> Agregado UUID: \e[92m$UUID "
while true; do
     echo -ne "\e[91m >> Duracion de UUID (Dias):\033[1;92m " && read diasuser
     if [[ -z "$diasuser" ]]; then
     err_fun 17 && continue
     elif [[ "$diasuser" != +([0-9]) ]]; then
     err_fun 8 && continue
     elif [[ "$diasuser" -gt "360" ]]; then
     err_fun 9 && continue
     fi 
     break
done
#Lim
[[ $(cat /etc/passwd |grep $1: |grep -vi [a-z]$1 |grep -v [0-9]$1 > /dev/null) ]] && return 1
valid=$(date '+%C%y-%m-%d' -d " +$diasuser days") && datexp=$(date "+%F" -d " + $diasuser days")
echo -e "\e[91m >> Expira el : \e[92m$datexp "
##Registro
echo "  $UUID | $nick | $valid " >> /etc/VPS-MX/RegV2ray
v2ray restart > /dev/null 2>&1
echo ""
v2ray info > /etc/VPS-MX/v2ray/confuuid.log
lineP=$(sed -n '/'${UUID}'/=' /etc/VPS-MX/v2ray/confuuid.log)
numl1=4
let suma=$lineP+$numl1
sed -n ${suma}p /etc/VPS-MX/v2ray/confuuid.log 
echo ""
msg -bar
echo -e "\e[92m           UUID AGREGEGADO CON EXITO "
msg -bar
}
msg -ama "$(fun_trans "MENU DE UTILITARIOS")"
msg -bar
echo -ne "\033[1;32m [1] > " && msg -azu "$(fun_trans "INSTALAR V2RAY") "
echo -ne "\033[1;32m [2] > " && msg -azu "$(fun_trans "CAMBIAR PROTOCOLO") "
echo -ne "\033[1;32m [3] > " && msg -azu "$(fun_trans "ACTIVAR TLS") "
echo -ne "\033[1;32m [4] > " && msg -azu "$(fun_trans "CAMBIAR PUERTO") "
echo -ne "\033[1;32m [5] > " && msg -azu "$(fun_trans "INFORMACION DE CUENTA")"
echo -ne "\033[1;32m [6] > " && msg -azu "$(fun_trans "DESINTALAR V2RAY")"
echo -ne "\033[1;32m [7] > " && msg -azu "$(fun_trans "AGREGAR USUARIO UUID")"
msg -bar && echo -ne "$(msg -verd "[0]") $(msg -verm2 ">") "&& msg -bra "\033[1;41mREGRESAR AL MENU"
msg -bar
while [[ ${arquivoonlineadm} != @(0|[1-7]) ]]; do
read -p "[0-7]: " arquivoonlineadm
tput cuu1 && tput dl1
done
case $arquivoonlineadm in
1)intallv2ray;;
2)protocolv2ray;;
3)tls;;
4)port;;
5)infocuenta;;
6)unistallv2;;
7)addusr;;
0)exit;;
esac
msg -bar
