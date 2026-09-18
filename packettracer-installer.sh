#!/usr/bin/env bash

set -euo pipefail

VERSION="1.0"

# ===============================
# Cisco Packet Tracer Universal Installer
# Linux Edition
# ===============================


RED="\033[1;31m"
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"


USER_HOME=$(eval echo ~$SUDO_USER)
TMP_DIR=$(mktemp -d)
LOG_FILE="/tmp/packettracer-installer.log"

trap 'rm -rf "$TMP_DIR"' EXIT


banner(){

clear

echo -e "${CYAN}"

cat << "EOF"

   ██████╗██╗███████╗ ██████╗ ██████╗
  ██╔════╝██║██╔════╝██╔════╝██╔═══██╗
  ██║     ██║███████╗██║     ██║   ██║
  ██║     ██║╚════██║██║     ██║   ██║
  ╚██████╗██║███████║╚██████╗╚██████╔╝
   ╚═════╝╚═╝╚══════╝ ╚═════╝ ╚═════╝


        CISCO PACKET TRACER
        UNIVERSAL LINUX INSTALLER

EOF

echo -e "${RESET}"

}



log(){

echo "$(date '+%F %T') $1" >> "$LOG_FILE"

}



detect_os(){

source /etc/os-release


case "$ID" in


arch|endeavouros|cachyos|garuda)

OS="arch"

;;


ubuntu|debian|linuxmint|pop|zorin)

OS="debian"

;;


fedora|nobara|rhel|rocky|almalinux)

OS="fedora"

;;


opensuse*|sles)

OS="suse"

;;


*)

echo -e "${RED}Unsupported Linux distribution${RESET}"
exit 1

;;

esac


echo -e "${GREEN}✓${RESET} Detected: $PRETTY_NAME"

log "Detected $PRETTY_NAME"

}



install_dependencies(){


echo -e "${CYAN}➜ Installing dependencies...${RESET}"


case "$OS" in


arch)

pacman -Sy --needed --noconfirm \
binutils \
fuse2 \
qt5-base \
qt5-multimedia \
qt5-webengine \
qt5-svg \
gstreamer \
gst-plugins-base

;;



debian)

apt update

apt install -y \
binutils \
fuse \
libqt5network5 \
libqt5multimedia5 \
libqt5webengine5

;;



fedora)

dnf install -y \
binutils \
fuse \
qt5-qtbase \
qt5-qtmultimedia

;;



suse)

zypper install -y \
binutils \
fuse \
libqt5-qtbase

;;

esac


}



find_installer(){


echo -e "${CYAN}➜ Searching Cisco Packet Tracer installer...${RESET}"


FILES=()


SEARCH_PATHS=(

"$USER_HOME"
"$USER_HOME/Downloads"
"$USER_HOME/Desktop"
"$USER_HOME/Documents"

)


for path in "${SEARCH_PATHS[@]}"
do


if [ -d "$path" ]; then


while IFS= read -r file
do

FILES+=("$file")

done < <(

find "$path" \
-type f \
-name "CiscoPacketTracer*.deb" \
2>/dev/null

)


fi


done



if [ ${#FILES[@]} -eq 0 ]; then


echo -e "${RED}"
echo "Packet Tracer installer not found."
echo
echo "Download from:"
echo "https://skillsforall.com/resources/lab-downloads"
echo -e "${RESET}"

exit 1


fi



if [ ${#FILES[@]} -eq 1 ]; then


PACKAGE="${FILES[0]}"


else


echo "Multiple installers found:"
echo


select file in "${FILES[@]}"
do

PACKAGE="$file"
break

done


fi



echo -e "${GREEN}✓${RESET} Selected:"
echo "$PACKAGE"


}



extract_package(){


echo -e "${CYAN}➜ Extracting package...${RESET}"


mkdir "$TMP_DIR/pkg"


cp "$PACKAGE" "$TMP_DIR/pkg/"


cd "$TMP_DIR/pkg"


ar x "$(basename "$PACKAGE")"



if [ -f data.tar.xz ]; then


tar -xf data.tar.xz -C "$TMP_DIR/pkg"


elif [ -f data.tar.zst ]; then


tar --zstd -xf data.tar.zst -C "$TMP_DIR/pkg"


else


echo -e "${RED}Invalid Packet Tracer package${RESET}"
exit 1


fi



}



create_launcher(){


echo -e "${CYAN}➜ Creating application launcher...${RESET}"


cat > /tmp/packettracer.desktop <<EOF

[Desktop Entry]
Name=Cisco Packet Tracer
Comment=Network Simulation Tool
Exec=/opt/pt/bin/PacketTracer
Icon=/opt/pt/art/app.png
Terminal=false
Type=Application
Categories=Education;Network;

EOF


mv /tmp/packettracer.desktop \
/usr/share/applications/


chmod 644 \
/usr/share/applications/packettracer.desktop


}



install_packettracer(){


echo -e "${CYAN}➜ Installing Packet Tracer...${RESET}"


rm -rf /opt/pt


cp -rf \
"$TMP_DIR/pkg/opt/pt" \
/opt/


chmod +x /opt/pt/bin/PacketTracer



create_launcher



echo
echo -e "${GREEN}"
echo "===================================="
echo " Cisco Packet Tracer Installed!"
echo " Run: packettracer"
echo "===================================="
echo -e "${RESET}"


}



uninstall(){


echo -e "${YELLOW}Removing Packet Tracer...${RESET}"


rm -rf /opt/pt

rm -f \
/usr/share/applications/packettracer.desktop


echo -e "${GREEN}✓ Removed successfully${RESET}"

}



main(){


banner


if [ "$EUID" -ne 0 ]; then

echo "Please run with sudo"
exit 1

fi



case "${1:-}" in


--uninstall)

uninstall
exit

;;


esac



detect_os

install_dependencies

find_installer

extract_package

install_packettracer


}



main "$@"
