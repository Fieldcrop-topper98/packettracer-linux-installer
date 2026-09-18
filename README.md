# Cisco Packet Tracer Linux Installer

A universal automated installer for Cisco Packet Tracer on Linux.

This project simplifies the installation process of Cisco Packet Tracer by automatically detecting the Linux distribution, installing required dependencies, extracting the official Cisco package and configuring desktop integration.

## Supported Distributions

🐧 Arch Linux
- Arch Linux
- EndeavourOS
- CachyOS
- Garuda Linux

🐧 Debian Based
- Debian
- Ubuntu
- Linux Mint
- Pop!_OS
- Zorin OS

🐧 Fedora Based
- Fedora
- Nobara
- Rocky Linux
- AlmaLinux

🐧 SUSE Based
- openSUSE

## Features

✨ Automatic Linux distribution detection  
✨ Dependency installation  
✨ Cisco Packet Tracer extraction and setup  
✨ Desktop launcher creation  
✨ Clean uninstall support  
✨ Bash based lightweight installer  

## Requirements

Download the official Cisco Packet Tracer `.deb` package from:

https://skillsforall.com/resources/lab-downloads

or

https://www.netacad.com/portal/resources/packet-tracer

Then run:

```bash
sudo ./packettracer-installer.sh PacketTracer.deb
