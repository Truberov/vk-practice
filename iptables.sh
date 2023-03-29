#!/bin/bash

# Заблокировать входящий трафик протокола ICMP с уведомлением о том, что порт недоступен
sudo iptables -A INPUT -p icmp -j REJECT --reject-with icmp-port-unreachable

# Разрешить входящий трафик только из подсетей 192.168.0.0/16
sudo iptables -A INPUT -s 192.168.0.0/16 -j ACCEPT

# Заблокировать входящий трафик из всех остальных источников
sudo iptables -A INPUT -j DROP

# Сохранить настройки iptables
sudo iptables-save > /etc/iptables/rules.v4
