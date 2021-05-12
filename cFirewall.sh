#/bin/sh
lightblue=`tput setaf 14` 
green=`tput setaf 46`     
RED=`tput setaf 196`      
yellow=`tput setaf 11`    
purple=`tput setaf 129`   
reset=`tput sgr0` 
clear

arrayIPV4=(103.21.244.0/22 103.22.200.0/22 103.31.4.0/22 104.16.0.0/13 104.24.0.0/14 108.162.192.0/18 
131.0.72.0/22 141.101.64.0/18 162.158.0.0/15 172.64.0.0/13 173.245.48.0/20 188.114.96.0/20 190.93.240.0/20 
197.234.240.0/22 198.41.128.0/17)

arrayIPV6=(2400:cb00::/32 2606:4700::/32 2803:f800::/32 2405:b500::/32 2405:8100::/32 2a06:98c0::/29 2c0f:f248::/32)



sudo ufw default deny incoming
sudo ufw default deny outgoing

for ipv4 in ${arrayIPV4[@]}
do
    sudo ufw allow proto tcp from $ipv4 to any port 80
    sudo ufw allow proto tcp from $ipv4 to any port 443
done

for ipv6 in ${arrayIPV6[@]}
do
    sudo ufw allow proto tcp from $ipv6 to any port 80
    sudo ufw allow proto tcp from $ipv6 to any port 443
done

sudo ufw enable
