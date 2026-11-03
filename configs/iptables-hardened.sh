#!/usr/bin/env bash
# ==============================================================================
# Production Linux Firewall & Kernel Hardening Script (iptables / UFW)
# Author: Md. Mahamudul Hasan (Support Engineer - ISP Software & Networking)
# ==============================================================================

set -euo pipefail

echo "[*] Initializing Linux Kernel Network Hardening & Firewall Rules..."

# Flush existing tables
iptables -F
iptables -t nat -F
iptables -X

# Default drop policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# 1. Allow Loopback interface
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# 2. Allow Established & Related Sessions
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 3. Drop Invalid Packets
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

# 4. Mitigate TCP SYN Flood Attacks (Rate-limiting SYN)
iptables -N SYN_FLOOD
iptables -A INPUT -p tcp --syn -j SYN_FLOOD
iptables -A SYN_FLOOD -m limit --limit 25/s --limit-burst 50 -j RETURN
iptables -A SYN_FLOOD -j DROP

# 5. Drop Ping of Death & ICMP Floods (Permit healthy ping for diagnosis)
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 5/s --limit-burst 10 -j ACCEPT
iptables -A INPUT -p icmp -j DROP

# 6. Open Inbound Services for Network Operations
# SSH (Rate limited)
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -m recent --set --name SSH
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -m recent --update --seconds 60 --hitcount 4 -j DROP
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# DNS (Port 53 TCP/UDP)
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT

# DHCP (Port 67/68 UDP)
iptables -A INPUT -p udp --dport 67:68 --sport 67:68 -j ACCEPT

# WireGuard VPN (Port 51820 UDP)
iptables -A INPUT -p udp --dport 51820 -j ACCEPT

# 7. Enable NAT Routing for Private Subnets
iptables -t nat -A POSTROUTING -s 192.168.20.0/24 -o eth0 -j MASQUERADE
iptables -A FORWARD -s 192.168.20.0/24 -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -d 192.168.20.0/24 -i eth0 -o eth1 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

echo "[+] Linux Network Hardening & Firewall Rules applied successfully."

