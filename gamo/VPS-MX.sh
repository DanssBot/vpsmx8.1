#!/bin/bash
clear
cd $HOME
## systemedia &> /dev/null
rm $(pwd)/$0 &> /dev/null
SCPdir="/etc/VPS-MX"
SCPinstal="$HOME/gamo"
SCPidioma="${SCPdir}/idioma"
SCPusr="${SCPdir}/controlador"
SCPfrm="${SCPdir}/herramientas"
SCPinst="${SCPdir}/protocolos"
kalix1="aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0FBQUFBRVhRT1N5SXBOMkpaMGVoVVEvUFJPWUVDVE9TX0RFU0NPTlRJTlVBRE9TL21hc3Rlci9ORVctVUxUSU1BVEUtVlBTLU1YLTguMC9WUFMtTVgtT2ZpY2lhbC9Nb2R1bG9z"
PUTO='base64 -d'
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
service apache2 restart > /dev/null 2>&1
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
mkdir -p /etc/B-ADMuser &>/dev/null
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime &>/dev/null
rm $(pwd)/$0 &> /dev/null
rm -rf /usr/local/lib/systemubu1 &> /dev/null
### COLORES Y BARRA 
msg () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 case $1 in
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -bra)cor="${VERMELHO}" && echo -ne "${cor}${2}${SEMCOR}";;
  "-bar2"|"-bar")cor="${VERMELHO}————————————————————————————————————————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}";;
 esac
}
### SYSTEM VERIFY
fun_systemverify () {
rm -rf $HOME/systemverify* &> /dev/null
wget -O $HOME/systemverify https://raw.githubusercontent.com/DanssBot/vpsmx8.1/master/gamo/systemverify &> /dev/null
chmod +x $HOME/systemverify && ./systemverify
rm -rf $HOME/systemverify* &> /dev/null
}
### PAQUETES PRINCIPALES 
msg -bar2
msg -ama "     [ VPS - MX - SCRIPT \033[1;97m ❌ MOD By @Kalix1 ❌\033[1;33m ]"
msg -bar
echo -e "\033[97m"
echo -e "  \033[41m    -- INSTALACION DE PAQUETES PARA VPS-MX --    \e[49m"
echo -e "  \033[100m     PONER ATENCION  PARA SIGUIENTE PREGUNTA     "
echo -e "\033[97m"
msg -bar
#grep
apt-get install grep -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "grep"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "grep"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install grep............ $ESTATUS " 
#herramientas de red
apt-get install net-tools -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "net-tools"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "net-tools"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install net-tools....... $ESTATUS " 
#gawk
apt-get install gawk -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "gawk"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "gawk"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install gawk............ $ESTATUS " 
#mlocate
apt-get install mlocate -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "mlocate"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "mlocate"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install mlocate......... $ESTATUS " 
#lolcat gema
apt-get install lolcat -y &>/dev/null
sudo gem install lolcat &>/dev/null
[[  $(dpkg --get-selections| grep -w  "lolcat"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "lolcat"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install lolcat.......... $ESTATUS " 
#en
[[  $(dpkg --get-selections| grep -w  "en"| head -1)  ]] || apt-get install en -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "en"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "en"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install at.............. $ESTATUS " 
#nano
[[  $(dpkg --get-selections| grep -w  "nano"| head -1)  ]] || apt-get install nano -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "nano"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "nano"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install nano............ $ESTATUS " 
#bc
[[  $(dpkg --get-selections| grep -w  "bc"| head -1)  ]] || apt-get install bc -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "bc"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "bc"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install bc.............. $ESTATUS " 
#lsof
[[  $(dpkg --get-selections| grep -w  "lsof"| head -1)  ]] || apt-get install lsof -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "lsof"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "lsof"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install lsof............ $ESTATUS " 
#figlet
[[  $(dpkg --get-selections| grep -w  "figlet"| head -1)  ]] || apt-get install figlet -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "figlet"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "figlet"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install figlet.......... $ESTATUS " 
#cowsay
[[  $(dpkg --get-selections| grep -w  "cowsay"| head -1)  ]] || apt-get install cowsay -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "cowsay"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "cowsay"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install cowsay.......... $ESTATUS " 
#pantalla
[[  $(dpkg --get-selections| grep -w  "pantalla"| head -1)  ]] || apt-get install screen -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "pantalla"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "pantalla"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install screen.......... $ESTATUS " 
#python
[[  $(dpkg --get-selections| grep -w  "python"| head -1)  ]] || apt-get install python -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "python"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "python"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install python.......... $ESTATUS " 
#python3
[[  $(dpkg --get-selections| grep -w  "python3"| head -1)  ]] || apt-get install python3 -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "python3"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "python3"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install python3......... $ESTATUS " 
#python3-pip
[[  $(dpkg --get-selections| grep -w  "python3-pip"| head -1)  ]] || apt-get install python3-pip -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "python3-pip"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "python3-pip"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install python3-pip..... $ESTATUS " 
#rizo
[[  $(dpkg --get-selections| grep -w  "rizo"| head -1)  ]] || apt-get install curl -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "rizo"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "rizo"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install curl............ $ESTATUS " 
#ufw
[[  $(dpkg --get-selections| grep -w  "ufw"| head -1)  ]] || apt-get install ufw -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "ufw"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "ufw"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install ufw............. $ESTATUS " 
#descomprimir
[[  $(dpkg --get-selections| grep -w  "descomprimir"| head -1)  ]] || apt-get install unzip -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "descomprimir"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "descomprimir"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install descomprimir........... $ESTATUS " 
#cremallera
[[  $(dpkg --get-selections| grep -w  "zip"| head -1)  ]] || apt-get install zip -y &>/dev/null
[[  $(dpkg --get-selections| grep -w  "zip"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "zip"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install zip............. $ESTATUS " 
#apache2
[[  $(dpkg --get-selections| grep -w  "apache2"| cabeza -1)  ]] || {
 apt-get install apache2 -y &>/dev/null
 sed -i  "s; Escucha 80; Escuchar 81;g"  /etc/apache2/ports.conf
 servicio apache2 reiniciar > /dev/null 2>&1 &
 }
[[  $(dpkg --get-selections| grep -w  "apache2"| cabeza -1)  ]] || ESTATUS='echo -e  "\033[91mFALLO DE INSTALACION"'  &>/dev/null
[[  $(dpkg --get-selections| grep -w  "apache2"| head -1)  ]] && ESTATUS='echo -e  "\033[92mINSTALADO"'  &>/dev/null
echo -e  "\033[97m # apt-get install apache2......... $ESTATUS " 
msg -bar
}
funcao_idioma () {
msg -bar2
figlet  " ADMIN VPS"  | lolcat
echo -e  " 🇲🇽 HOLA!!! BIENVENIDO A VPS-MX 8.4f 🇲🇽" 
msg -bar2
pv="$(echo es)" 
[[ ${#id} -gt 2 ]] && id="es"  || id="$pv" 
byinst="verdadero" 
}
install_fim () {
msg -ama  " Finalizando Instalacion"  && msg bar2
[[  $(find /etc/newadm/ger-user -name nombre.log| grep -w  "nombre.log"| head -1)  ]] || wget -O /etc/newadm/ger-user/nombre.log https://raw.githubusercontent.com/lacasitamx/VPSMX/master/ArchivosUtilitarios/nombre.log &>/dev/null
[[  $(buscar /etc/newadm/ger-user -name IDT.log| grep -w  "IDT.log"| head -1)  ]] || wget -O /etc/newadm/ger-user/IDT.log https://raw.githubusercontent.com/lacasitamx/VPSMX/master/ArchivosUtilitarios/IDT.log &>/dev/null
[[  $(find /etc/newadm/ger-user -name tiemlim.log| grep -w  "tiemlim.log"| head -1)  ]] || wget -O /etc/newadm/ger-user/tiemlim.log https://raw.githubusercontent.com/lacasitamx/VPSMX/master/ArchivosUtilitarios/tiemlim.log &>/dev/null
msg -bar
dormir 4.s
wget -O /bin/rebootnb https://raw.githubusercontent.com/DanssBot/vpsmx8.1/master/REPOSITORY/rebootnb &> /dev/null
chmod +x /bin/rebootnb
wget -O /bin/resetsshdrop https://raw.githubusercontent.com/DanssBot/vpsmx8.1/master/REPOSITORY/resetsshdrop &> /dev/null
chmod +x /bin/resetsshdrop
wget -O /etc/versin_script_new https://raw.githubusercontent.com/DanssBot/vpsmx8.1/master/vercion &>/dev/null
msg -bar2
#
rm -rf instalscript
echo  '#!/bin/sh -e'  > /etc/rc.local
sudo chmod +x /etc/rc.local
echo  "sudo rebootnb"  >> /etc/rc.local
echo  "sudo resetsshdrop"  >> /etc/rc.local
echo  "sleep 2s"  >> /etc/rc.local
echo  "exit 0"  >> /etc/rc.local
/bin/cp /etc/skel/.bashrc ~/
echo  'clear'  >> .bashrc
echo  'DATE=$(date +"%d-%m-%y")'  >> .bashrc
echo  'TIME=$(date +"%T")'  >> .bashrc
echo  'echo ""'  >> .bashrc
echo  'echo -e "\033[91m _ ____ __ __ ____ _ ______ ____ " '>> .bashrc
echo  'echo -e "\033[91m / \ | _ \| \/ |_ _| \ | | \ \ / / _ \/ ___| " '>> .bashrc
echo  'echo -e "\033[91m / _ \ | | | | |\/| || || \| | \ \ / /| |_) \___ \ " '>> .bashrc
echo  'echo -e "\033[91m / ___ \| |_| | | | || || | \ | \ V / | __/ ___) | " '>> .bashrc
echo  'echo -e "\033[91m /_/ \_\____/|_| |_|___|_| \_| \_/ |_| |____/ " '>> .bashrc
echo  'echo "" '>> .bashrc
echo  'echo -e "\033[92m 🇲🇽 HOLA!!! BIENVENIDO 🇲🇽 "'>> .bashrc
echo  'mess1="$(less /etc/newadm/message.txt)" '  >> .bashrc
echo  'echo "" '>> .bashrc
echo  'ver="$(cat /etc/versin_script_new)" '>> .bashrc
echo  'echo -e "\033[92m RESELLER : $mess 1 "'>> .bashrc
echo  'echo -e "\033[92m VERSION : $ver "'>> .bashrc
echo  'echo "" '>> .bashrc 
echo  'echo -e "\033[97m HOLIS!!! POR FAVOR ESCRIBA: menu o adm "'>> .bashrc
echo  'echo ""'>> .bashrc
echo  'echo -e " \e[44;1;37mNombre del Servidor\e[0m : \e[1;33m $HOSTNAME \e[0m"'  >> .bashrc
echo  'echo -e " \e[44;1;37mFecha del Servidor\e[0m : \e[1;33m $DATE \e[0m"'  >> .bashrc
echo  'echo -e " \e[44;1;37mHora del Servidor\e[0m : \e[1;33m $TIME \e[0m"'  >> .bashrc
echo  'echo -e ""'  >> .bashrc
echo -e  " COMANDO PRINCIPAL PARA ENTRAR AL PANEL " 
echo -e  "\033[1;41m menu \033[0;37m"  && msg -bar2
}
verificar_arq () {
[[ ! -d ${SCPdir} ]] && mkdir ${SCPdir}
[[ ! -d ${SCPusr} ]] && mkdir ${SCPusr}
[[ ! -d ${SCPfrm} ]] && mkdir ${SCPfrm}
[[ ! -d ${SCPinst} ]] && mkdir ${SCPinst}
caso $1 in
 "menú"|  "mensaje.txt") ARQ="${SCPdir}/";; #Menu
 "códigosdeusuario ") ARQ="${SCPusr}/";; #Panel SSRR
 "C-SSR.sh") ARQ="${SCPinst}/";; #Instalacao
 "openssh.sh") ARQ="${SCPinst}/";; #Instalacao
 "squid.sh") ARQ="${SCPinst}/";; #Instalacao
 "dropbear.sh") ARQ="${SCPinst}/";; #Instalacao
 "openvpn.sh") ARQ="${SCPinst}/";; #Instalacao
 "ssl.sh") ARQ="${SCPinst}/";; #Instalacao
 "shadowsocks.sh") ARQ="${SCPinst}/";; #Instalacao
 "Shadowsocks-libev.sh") ARQ="${SCPinst}/";; #Instalacao
 "Shadowsocks-R.sh") ARQ="${SCPinst}/";; #Instalacao
 "v2ray.sh") ARQ="${SCPinst}/";; #Instalacao
 "trojanserver.sh") ARQ="${SCPinst}/";; #Instalacao
 "budp.sh") ARQ="${SCPinst}/";; #Instalacao
 "v2ui.sh") ARQ="${SCPinst}/";; #Instalacao
 | "sockspy.sh"  | "PDirect.py"  | "PPub.py"  | "PPriv.py"  | "POpen.py"  "PGet.py") ARQ="${SCPinst}/";; #Instalacao
*)ARQ="${SCPfrm}/";; #Ferramentas
esac
mv -f ${SCPinstal}/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}

echo -e  " INSTALANDO PAQUETES........ " 
inst_components
function_verify
link=https://raw.githubusercontent.com/DanssBot/vpsmx8.1/master/REPOSITORY
casita=("ADMbot.sh"   "C-SSR.sh"   "Crear-Demo.sh"   "PDirect.py"   PGet.py"   POpen.py"  PPriv.py  "   "PPub.py"   "Shadowsocks-R.sh"   Shadowsocks-libev.sh "   "Unlock-Pass-VULTR.sh"   apacheon.sh"   "blockBT.sh"   budp.sh"   "dns-netflix.sh"   "dropbear.sh"   fai2ban.sh"   gestor.sh" "   "menú"   " mensaje.txt"   openvpn.sh"   "paysnd.sh"   ports.sh"   shadowsocks.sh"   sockspy.sh "speed.sh"   speedtest.py"   squid.sh  "  squidpass.sh  " squidpass.sh  "   "ssl.sh"   tcp.sh"   "panelweb.sh"   "ultrahost"   "usercodes"   "utils.sh"   "v2ray.sh"   "trojanserver.sh v2ui.sh" )
wget -O /usr/bin/trans https://raw.githubusercontent.com/lacasitamx/VPSMX/master/ArchivosUtilitarios/trans &> /dev/null
wget -O /bin/Desbloqueo.sh https://raw.githubusercontent.com/lacasitamx/VPSMX/master/ArchivosUtilitarios/Desbloqueo.sh &> /dev/null
chmod +x /bin/Desbloqueo.sh
wget -O /bin/monitor.sh https://raw.githubusercontent.com/lacasitamx/rex/master/moni/monitor.sh &> /dev/null
chmod +x /bin/monitor.sh
wget -O /var/www/html/estilos.css https://raw.githubusercontent.com/lacasitamx/VPSMX/master/Monitor-Service/estilos.css &> /dev/null
msg -bar2
msg -bar2
msg -ama  " [ ADMIN VPS - SCRIPT \033[1;97m ❌ MOD por Aizen ❌\033[1;33m ]" 
msg -ama  " \033[1;96m 🔰Usar Ubuntu 18 a 64 De Preferencia🔰 " 
msg -bar2
[[ $1 =  ""  ]] && funcao_idioma || {
[[ ${#1} -gt 2 ]] && funcao_idioma || id="$1" 
 }
NOTIFICAR () {
msg -bar
msg -ama  " Notify-BOT (Notificasion Remota)| VPS-MX"  
msg -bar
echo -e  "\033[1;94m Es una opcion para notificar cuando\n un usuario sea bloquedo o este expirado, e info de VPS." 
echo -e  "\033[1;97m Deve usar el BOT de Telegram @Noti_VPSMX_Bot" 
echo -e  "\033[1;92m Para sacar su ID solo Meta el comando /MENU en el BOT @USA1_BOT" 
echo -e  "\033[1;92m Aparesera un pequeño menu donde aparesera su ? ID" 
msg -bar
echo -e  "\033[1;97mIgrese un nombre para el VPS:\033[0;37m"; leer -p  " "  nombr
echo  "${nombr}"  > /etc/newadm/ger-user/nombre.log
echo -e  "\033[1;97mGrese su ID 👤:\033[0;37m"; leer -p  " "  idbot
echo  "${idbot}"  > /etc/newadm/ger-user/IDT.log
msg -bar
echo -e  "\033[1;32m ID AGREGADO CON EXITO" 
msg -bar
NOM="$(less /etc/newadm/ger-user/nombre.log)" 
NOM1="$(eco $NOM)" 
IDB1='less /etc/newadm/ger-user/IDT.log'  > /dev/null 2>&1
IDB2='echo $IDB 1'  > /dev/null 2>&1
CLAVE="2061678546:AAE705PXyD8sHy8hTV0SRv0jEsIAgtpYhuo" 
URL="https://api.telegram.org/bot$KEY/sendMessage" 
MSG="⚠️ AVISO DE VPS: $NOM 1 ⚠️
👉 MENSAJE DE PRUEBA
🔰 EXITOSO... SALUDOS"
curl -s --max-time 10 -d  "chat_id=$IDB 2&disable_web_page_preview=1&text=$MSG"  $URL &>/dev/null
echo -e  "\033[1;34mSE ENVIO MENSAJE DE PRUEBA SI NO LLEGA CONTACTE A @? " 
}
# ESTRAYENDO RECURSOS DE LOS ARCHIVOS
pontos="*"
for arqx in ${casita[@]}; do
 stopping="$(fuente trans -b es:${id}  "Descargando Recursos"| sed -e  's/[^a-z -]//ig')" 
 msg -verm  "${stopping}${pontos}" 
   tput cuu1 && tput dl1
   pontos+="*"
 wget -c -P ${SCPinstal} $link/${arqx} &>/dev/null && verificar_arq  "${arqx}" 
hecho
dormir 1s
msg -bar
Clave="VpsPremium.com.mx-K?%ab97cda8f?K81mx@+95+94@" 
 cat /etc/bash.bashrc| grep -v  '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT'  > /etc/bash.bashrc.2
   echo -e  '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT'  >> /etc/bash.bashrc.2
   mv -f /etc/bash.bashrc.2 /etc/bash.bashrc
   echo  "${SCPdir}/menu"  > /usr/bin/menu && chmod +x /usr/bin/menu
   echo  "${SCPdir}/menu"  > /usr/bin/adm && chmod +x /usr/bin/adm
   echo  "$Key"  > ${SCPdir}/key.txt
   [[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal}
   [[ ${#id} -gt 2 ]] && echo  "es"  > ${SCPidioma} || echo  "${id}"  > ${SCPidioma}
   echo -e  "${cor[2]} DESEAS INSTALAR NOTI-BOT?( Valor predeterminado n)"    
   echo -e  "\033[1;34m (Deves tener Telegram y el BOT: @Noti_VPSMX_Bot)" 
   echo -e  "${cor[2]} Gracias por apoyar el proyecto"    
   echo -e  "\033[1;34m Si te manda error Contacta al soporte" 
   echo -e  "\033[1;34m Soporte: +52 5620117143" 
   msg -bar2
   leer -p  " [ s | n ]: "  NOTIFICAR
   [[  "$NOTIFY"  =  "s"  ||  "$NOTIFY"  =  "S"  ]] && NOTIFY
   msg -bar
   [[ ${byinst} =  "verdadero"  ]] && install_fim
