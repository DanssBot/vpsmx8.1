#!/bin/bash
#08/02/2021
declare -A cor=( [0]="\033[1;37m" [1]="\033[1;34m" [2]="\033[1;31m" [3]="\033[1;33m" [4]="\033[1;32m" )
SCPfrm="/etc/ger-frm" && [[ ! -d ${SCPfrm} ]] && exit
SCPinst="/etc/ger-inst" && [[ ! -d ${SCPinst} ]] && exit
trojanserver () {
echo -e "\033[1;33m Se instalará el servidor de Trojan\033[0m"
echo -e "\033[1;33m Si ya tenías una instalacion Previa, esta se eliminara\033[0m"
echo -e "\033[1;33m Debes tener instalado previamente GO Lang\033[0m"
echo -e "\033[1;33m IMPORTANTE DEBES TENER LIBRES PUERTOS 80 / 443\033[0m"
echo -e "\033[1;33m Continuar?\033[0m"
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
read -p "[S/N]: " yesno
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
killall trojan
bash -c "$(wget -O- https://raw.githubusercontent.com/trojan-gfw/trojan-quickstart/master/trojan-quickstart.sh)"
clear
echo -e "Δ Generando Certificados SSL"
mkdir /etc/trojan/trojancert 1> /dev/null 2> /dev/null
curl -o /usr/local/etc/trojan/config.json https://raw.githubusercontent.com/powermx/dl/master/config.json 1> /dev/null 2> /dev/null
openssl genrsa 2048 > /etc/trojan/trojancert/trojan.key
chmod 400 /etc/trojan/trojancert/trojan.key
openssl req -new -x509 -nodes -sha256 -days 365 -key /etc/trojan/trojancert/trojan.key -out /etc/trojan/trojancert/trojan.crt
clear
echo -e "\033[1;37mΔ Generando Configuracion"
sed -i '13i        "cert":"/etc/trojan/trojancert/trojan.crt",' /usr/local/etc/trojan/config.json
sed -i '14i        "key":"/etc/trojan/trojancert/trojan.key",' /usr/local/etc/trojan/config.json
echo -e "[\033[1;31m-\033[1;33m]\033[1;31m ───────────────────────────────────────\033[1;33m"
echo -e "\033[1;33mΔ Escriba el puerto de Trojan Server"
read -p ": " trojanport
sed -i 's/443/'$trojanport'/g' /usr/local/etc/trojan/config.json
echo -e "\033[1;33mΔ Escriba el password de Trojan Server"
read -p ": " trojanpass
sed -i 's/vpspack/'$trojanpass'/g' /usr/local/etc/trojan/config.json
echo -e "\033[1;32mΔ Iniciando Trojan Server"
screen -dmS trojanserv trojan /usr/local/etc/trojan/config.json
clear
echo -e "[\033[1;31m-\033[1;33m]\033[1;31m ───────────────────────────────────────\033[1;33m"
echo -e "\033[1;33mTrojan Server Instalado"
echo -e "\033[1;33mEl puerto del servidor es: \033[1;32m $trojanport"
echo -e "\033[1;33mEl password del servidor es: \033[1;32m $trojanpass"
echo -e "\033[1;33mSi necesitas cambiar el password edita el archivo o Reinstala tu servidor"
echo -e "\033[1;32mRuta de Configuracion: /usr/local/etc/trojan/config.json"
echo -e "\033[1;31mPRESIONE ENTER PARA CONTINUAR\033[0m"
read -p " "
menu
fi
}
function goinst () {
echo -e "A continuacion se instalara el paquete GO Lang"
echo -e "Continuar?"
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
read -p "[S/N]: " yesno
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
echo -e "Instalando..."
cd
rm -rf /usr/local/go 1> /dev/null 2> /dev/null
wget https://golang.org/dl/go1.15.linux-amd64.tar.gz 1> /dev/null 2> /dev/null
tar -C /usr/local -xzf go1.15.linux-amd64.tar.gz
if cat /root/.bashrc | grep GOROOT; then
echo -e "Ya existe un GoROOT - Skipping"
else
sed -i '$a export GOROOT=/usr/local/go' /root/.bashrc
sed -i '$a export GOPATH=$HOME/go' /root/.bashrc
sed -i '$a export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' /root/.bashrc
rm go1.15.linux-amd64.tar.gz
source /root/.bashrc
fi
sleep 5
echo -e "Reiniciando Fuente de Terminal..."
fi
echo -e "\033[1;33m Para finalizar el proceso de Instalacion de GO escribe :\033[0m"
echo -e "\033[1;32m source ~/.profile\033[0m"
echo -e "\033[1;31mPRESIONE ENTER PARA CONTINUAR\033[0m"
read -p " "
exit 0
}

msg -ama "$(fun_trans "MENU DE UTILITARIOS")"
msg -bar
echo -ne "\033[1;32m [1] > " && msg -azu "$(fun_trans "INSTALAR TROJAN SERVER") "
echo -ne "\033[1;32m [2] > " && msg -azu "$(fun_trans "INSTALAR Go Lang") "
msg -bar
while [[ ${arquivoonlineadm} != @(0|[1-5]) ]]; do
read -p "[0-5]: " arquivoonlineadm
tput cuu1 && tput dl1
done
case $arquivoonlineadm in
1)trojanserver;;
2)goinst;;
esac
msg -bar
