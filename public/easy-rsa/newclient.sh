cd /etc/openvpn/easy-rsa/
./easyrsa build-client-full $1 nopass
cd /www/wwwroot/vpn.itcoder.top/openvpn-admin/public/easy-rsa/keys/
cp /etc/openvpn/client-common.txt ./$1.ovpn
echo "<ca>" >> ./$1.ovpn
cat /etc/openvpn/easy-rsa/pki/ca.crt >> ./$1.ovpn
echo "</ca>" >> ./$1.ovpn
echo "<cert>" >> ./$1.ovpn
cat /etc/openvpn/easy-rsa/pki/issued/$1.crt >> ./$1.ovpn
echo "</cert>" >> ./$1.ovpn
echo "<key>" >> ./$1.ovpn
cat /etc/openvpn/easy-rsa/pki/private/$1.key >> ./$1.ovpn
echo "</key>" >> ./$1.ovpn
echo "<tls-auth>" >> ./$1.ovpn
cat /etc/openvpn/ta.key >> ./$1.ovpn
echo "</tls-auth>" >> ./$1.ovpn