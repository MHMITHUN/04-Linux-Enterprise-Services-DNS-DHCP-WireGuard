# Production Linux Network Infrastructure: BIND9 DNS, ISC-DHCP, WireGuard VPN & Firewall Hardening

[![Live Demo](https://img.shields.io/badge/Demo-Live%20Linux%20Services%20Hub-06b6d4)](https://mhmithun.github.io/04-Linux-Enterprise-Services-DNS-DHCP-WireGuard/)
[![License: MIT](https://img.shields.io/badge/License-MIT-emerald.svg)](LICENSE)
[![Platform: Ubuntu & CentOS](https://img.shields.io/badge/Linux-Ubuntu%2022.04%20%2F%20CentOS%209-orange.svg)](configs/iptables-hardened.sh)
[![VPN: WireGuard](https://img.shields.io/badge/VPN-WireGuard%20Tunnel-purple.svg)](configs/wg0.conf)

Automated production Linux network services suite delivering high-availability BIND9 authoritative & recursive DNS resolution, ISC-DHCP static reservations & option 43/66 VoIP provisioning, next-generation ChaCha20-Poly1305 WireGuard VPN site-to-site connectivity, and stateful iptables/UFW kernel security hardening.

---

## 🌐 Live Interactive Dashboard (`index.html`)

An interactive Linux Systems & Network Services Management Console:
- **Live DNS Query Resolver (`dig` / `nslookup`)**: Test domain lookups for forward (`A`, `CNAME`, `MX`) and reverse (`PTR`) zone records with query latency feedback.
- **Active DHCP Leases Table**: View active client MAC-to-IP leases, lease expiration timers, and reserve static IPs.
- **WireGuard VPN Cryptographic Handshake Status**: Monitor real-time public key handshakes, endpoint IPs, and Rx/Tx traffic counters.
- **Interactive Linux CLI Simulator**: Run `systemctl status bind9`, `cat /etc/dhcp/dhcpd.conf`, `wg show`, `iptables -L -v -n`, and `journalctl -u isc-dhcp-server`.

---

## 🛠️ Key Technical Implementations

1. **Authoritative & Caching DNS (BIND9)**:
   - Configured split-horizon DNS resolving internal ISP domains (`asiannet.internal`) while caching and forwarding public queries to root resolvers.
   - Forward zone (`configs/db.asiannet.internal`) defining mail exchange records (`MX`), gateway records, and NOC monitoring endpoints.
   - Reverse PTR zone (`configs/db.192.168.30`) for authoritative reverse IP lookups.

2. **ISC-DHCP Enterprise Server (`configs/dhcpd.conf`)**:
   - High-performance IP allocation for `/24` subnets with 12-hour default lease timers.
   - Fixed host MAC reservations for servers, printers, and management switches.
   - Custom DHCP options: Option 3 (Router Gateway), Option 6 (Domain Name Servers), Option 15 (Domain Name).

3. **WireGuard Site-to-Site Encrypted Tunnel (`configs/wg0.conf`)**:
   - Secure interconnect between Head Office NOC and Gazipur Branch Office.
   - Modern elliptic-curve Curve25519 cryptography with persistent keepalive (25s) across NAT gateways.

4. **Iptables & Linux Kernel Hardening (`configs/iptables-hardened.sh`)**:
   - Stateful connection tracking (`--state RELATED,ESTABLISHED`).
   - Mitigates SYN Flood, Port Scans, and Ping of Death with `iptables` rate-limiting.
   - Transparent Carrier-Grade NAT (CGNAT) masquerade rules.

---

## 📁 Repository Structure
```
├── configs/
│   ├── db.192.168.30             # Reverse lookup PTR zone file
│   ├── db.asiannet.internal       # Forward lookup zone file
│   ├── dhcpd.conf                # ISC-DHCP server pool configuration
│   ├── iptables-hardened.sh      # Bash script for kernel firewall rules
│   ├── named.conf.local          # BIND9 zone declarations
│   └── wg0.conf                  # WireGuard VPN server configuration
├── index.html                    # Interactive Linux services web console
├── LICENSE
└── README.md
```

---

## 🚀 Quick Start
```bash
# Clone repository
git clone https://github.com/MHMITHUN/04-Linux-Enterprise-Services-DNS-DHCP-WireGuard.git
cd 04-Linux-Enterprise-Services-DNS-DHCP-WireGuard

# Deploy firewall hardening
sudo bash configs/iptables-hardened.sh
```

---

## 📄 License & Maintainer
Maintained by **[MD. Mahamudul Hasan](https://github.com/MHMITHUN)**  
- Email: mhmmithun1@gmail.com | Phone: 01560027539  
- GitHub: [@MHMITHUN](https://github.com/MHMITHUN) | LinkedIn: [linkedin.com/in/mahamudul0](https://linkedin.com/in/mahamudul0)  
Released under the [MIT License](LICENSE).

