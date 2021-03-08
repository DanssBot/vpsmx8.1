#!/bin/bash
if [ `whoami` != 'root' ] 
   then 
     echo -e "Debes ser root para ejecutar este script" 
     exit 
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
mkdir /var/lib/premium-script;
echo " Ingrese el nombre de host del subdominio VPS,\n  si no está disponible, haga clic en Enter "
read -p "Hostname: " host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
#install ssh ovpn
wget https://marloxxxssh.xyz/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://marloxxxssh.xyz/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#installwg
wget https://marloxxxssh.xyz/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install ssr
wget https://marloxxxssh.xyz/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://marloxxxssh.xyz/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#install v2ray
wget http://marloxxxssh.xyz/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
#install L2TP
wget https://marloxxxssh.xyz/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
echo " "
echo "¡¡La instalación se ha completado !! "
echo " "
echo "=================================-Autoscript Premium-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 443, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3453"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - Trojan                  : 445"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 00.00 GMT +7" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : Horas Marolop Amsal Siregar"  | tee -a log-install.txt
echo "   - Telegram                : T.me/Horasss"  | tee -a log-install.txt
echo "   - Instagram               : @horas_96"  | tee -a log-install.txt
echo "   - Whatsapp                : 082386143124"  | tee -a log-install.txt
echo "   - Facebook                : https://www.facebook.com/Marlosirega" | tee -a log-install.txt
echo "------------------Script Created By Horas Marolop Amsal Siregar-----------------" | tee -a log-install.txt
echo ""
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot