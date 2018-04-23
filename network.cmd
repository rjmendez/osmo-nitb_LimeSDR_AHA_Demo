echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A POSTROUTING -s 172.16.0.0/16 -t nat -o wlan0 -j MASQUERADE
iptables -t nat -I PREROUTING -i tun0 -p tcp -m multiport --dports 80,443 -j DNAT --to-dest 172.16.0.1:8080
