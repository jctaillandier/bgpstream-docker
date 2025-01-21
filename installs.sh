
apt install python3-pip -y
apt install wget -y

apt-get install -y curl apt-transport-https ssl-cert ca-certificates gnupg lsb-release 

curl -1sLf 'https://dl.cloudsmith.io/public/wand/libwandio/cfg/setup/bash.deb.sh' | bash

echo "deb https://pkg.caida.org/os/$(lsb_release -si|awk '{print tolower($0)}') $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/caida.list
 
wget -O /etc/apt/trusted.gpg.d/caida.gpg https://pkg.caida.org/os/ubuntu/keyring.gpg
apt update; apt install bgpstream -y
