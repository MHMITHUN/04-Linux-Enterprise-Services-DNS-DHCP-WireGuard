# Linux Network Infrastructure: ISC-DHCP Server, BIND9 DNS & Secure SSH Hardening

[![Live Demo](https://img.shields.io/badge/Demo-Live%20Linux%20Services-06b6d4)](https://mhmithun.github.io/04-Linux-Enterprise-Services-DNS-DHCP-WireGuard/)
[![License: MIT](https://img.shields.io/badge/License-MIT-emerald.svg)](LICENSE)
[![Platform: Linux Ubuntu/CentOS](https://img.shields.io/badge/Linux-Ubuntu%2022.04%20%7C%20CentOS%209-blue.svg)](#)

A production-grade Linux server administration project establishing essential enterprise TCP/IP infrastructure services. Deploys an authoritative BIND9 DNS server for internal name resolution, an ISC-DHCP server managing dynamic IP address pools with static MAC reservations, OpenSSH security hardening with public-key authentication, and an encrypted WireGuard VPN tunnel.

---

## 🌐 Live Engineering Dossier
Access the live interactive technical dossier hosted on GitHub Pages:
👉 **[https://mhmithun.github.io/04-Linux-Enterprise-Services-DNS-DHCP-WireGuard/](https://mhmithun.github.io/04-Linux-Enterprise-Services-DNS-DHCP-WireGuard/)**

Key features in the live dossier:
1. **Service Architecture:** High-availability topology overview for ISC-DHCP, BIND9, OpenSSH, and WireGuard daemons.
2. **Production DHCP Configuration:** `/etc/dhcp/dhcpd.conf` with dynamic scopes, lease duration tuning, and fixed MAC reservations.
3. **Authoritative BIND9 DNS Zone Database:** Forward and reverse zone files resolving internal hostnames and MX mail records.
4. **OpenSSH Server Hardening:** Hardened `/etc/ssh/sshd_config` parameters with port customization, root login disablement, and ED25519 key authentication.
5. **SQA Defect RCA Case Study:** Real incident triage resolving client IP starvation caused by unexpired lease retention.

---

## 📁 Repository Structure
```
├── configs/
│   ├── dhcpd.conf               # ISC-DHCP Server scope configuration
│   ├── named.conf.local         # BIND9 zone declarations
│   ├── db.corp.enterprise.local # Forward lookup zone database
│   └── sshd_config              # Hardened OpenSSH daemon configuration
├── index.html                   # Interactive Multi-Section Engineering Dossier
├── README.md                    # Technical Documentation
└── LICENSE                      # MIT Open Source License
```

---

## 👨‍💻 Author
**MD. Mahamudul Hasan**  
Software & Network Support Engineer  
[GitHub Profile](https://github.com/MHMITHUN) · [LinkedIn Profile](https://linkedin.com/in/mahamudul0)
