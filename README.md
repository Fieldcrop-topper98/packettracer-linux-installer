# 🚀 Cisco Packet Tracer Linux Installer

A universal automated installer for **Cisco Packet Tracer** on Linux distributions.

Installing Cisco Packet Tracer on Linux can sometimes require manual extraction, dependency installation, and desktop configuration. This project simplifies the entire process by automatically detecting the Linux distribution, installing required dependencies, finding the official Cisco Packet Tracer package, extracting application files, and creating a desktop launcher.

The goal of this project is to provide a simple, clean, and automated installation experience for Linux users, especially network engineers and students who use Cisco Packet Tracer for networking labs.

---

# ✨ Features

## 🔍 Automatic System Detection

The installer automatically detects your Linux distribution and selects the correct package manager.

Supported package managers:

- `pacman` (Arch-based)
- `apt` (Debian-based)
- `dnf` (Fedora-based)
- `zypper` (SUSE-based)

---

## 📦 Automatic Packet Tracer Detection

No need to manually specify the installer path.

The script automatically searches common directories:

```
~/Downloads
~/Desktop
~/Documents
~
```

for the official Cisco Packet Tracer package:

```
CiscoPacketTracer_xxx_Ubuntu_64bit.deb
```

If multiple installers are found, the user can select the desired version.

---

## ⚡ Automated Installation

The installer automatically:

- Installs required dependencies
- Extracts the Cisco Packet Tracer `.deb` package
- Installs application files
- Configures permissions
- Creates desktop integration
- Adds application launcher

After installation, Packet Tracer can be launched normally from the application menu or:

```bash
packettracer
```

---

# 🐧 Supported Linux Distributions

## Arch Linux Based

Compatible with:

- Arch Linux
- EndeavourOS
- CachyOS
- Garuda Linux


## Debian Based

Compatible with:

- Debian
- Ubuntu
- Linux Mint
- Pop!_OS
- Zorin OS


## Fedora Based

Compatible with:

- Fedora Linux
- Nobara Linux
- Rocky Linux
- AlmaLinux


## SUSE Based

Compatible with:

- openSUSE

---

# 📥 Download Cisco Packet Tracer

This project does **not** include Cisco Packet Tracer.

Cisco Packet Tracer is proprietary software provided by Cisco Systems.

You must download the official installer from Cisco.

## Cisco Skills For All

Download page:

https://skillsforall.com/resources/lab-downloads


## Cisco Networking Academy

Download page:

https://www.netacad.com/portal/resources/packet-tracer


After downloading, you should have a file similar to:

```
CiscoPacketTracer_900_Ubuntu_64bit.deb
```

Move the file to your home directory or Downloads folder.

The installer will automatically detect it.

---

# ⚙️ Installation

## 1. Clone the Repository

```bash
git clone https://github.com/kasra-abbaszadeh/packettracer-linux-installer.git
```

Enter the project directory:

```bash
cd packettracer-linux-installer
```

---

## 2. Make the Script Executable

```bash
chmod +x packettracer-installer.sh
```

---

## 3. Run the Installer

```bash
sudo ./packettracer-installer.sh
```

The installer will automatically:

```
✔ Detect Linux distribution
✔ Install dependencies
✔ Find Packet Tracer package
✔ Extract application files
✔ Create launcher
✔ Complete installation
```

---

# 📌 Manual Installation

You can also provide the `.deb` file manually:

```bash
sudo ./packettracer-installer.sh /path/to/CiscoPacketTracer.deb
```

Example:

```bash
sudo ./packettracer-installer.sh ~/Downloads/CiscoPacketTracer_900_Ubuntu_64bit.deb
```

---

# 🗑️ Uninstall

To completely remove Cisco Packet Tracer:

```bash
sudo ./packettracer-installer.sh --uninstall
```

The uninstall process removes:

- Application files
- Desktop launcher
- Installation directory

---

# 📂 Project Structure

```
packettracer-linux-installer/

│
├── packettracer-installer.sh
├── README.md
└── LICENSE
```

---

# 🛠️ Technologies Used

This project was built using:

- Bash Scripting
- Linux Shell Automation
- Package Management
- System Administration Concepts

---

# 🎯 Project Purpose

This project was created to improve Linux automation skills and provide an easier installation method for Cisco Packet Tracer users.

It demonstrates practical experience with:

- Linux administration
- Bash scripting
- Software deployment
- Cross-distribution compatibility
- Network engineering tools

---

# 🤝 Contributing

Contributions are welcome!

You can help improve this project by:

- Reporting issues
- Suggesting improvements
- Adding support for more distributions
- Improving compatibility

Steps:

1. Fork the repository
2. Create a new branch

```bash
git checkout -b feature/improvement
```

3. Commit your changes

```bash
git commit -m "Add new feature"
```

4. Push the branch

```bash
git push origin feature/improvement
```

5. Open a Pull Request

---

# ⚠️ Disclaimer

Cisco Packet Tracer is proprietary software owned by Cisco Systems.

This repository does not redistribute Cisco Packet Tracer.

It only automates the installation of the official package downloaded by the user from Cisco.

---

# 📄 License

This project is licensed under the MIT License.

---

# ⭐ Support

If this project helped you, consider giving it a ⭐ on GitHub.

Your feedback helps improve the project and add more Linux support.
