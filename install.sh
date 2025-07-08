#!/bin/bash

clear
echo "=========================================="
echo "🔧 Installing HackLab Enumeration Tools..."
echo "=========================================="
sleep 1

# Ensure the system is up to date
echo "[+] Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install dependencies from APT
echo "[+] Installing required APT tools..."
sudo apt install -y \
    nmap \
    nikto \
    whatweb \
    gobuster \
    ffuf \
    rustscan \
    dirb \
    wafw00f \
    enum4linux \
    nbtscan \
    snmp \
    snmpcheck \
    onesixtyone \
    whois \
    traceroute \
    mtr \
    hping3 \
    theharvester \
    xprobe2 \
    sinfp \
    telnet \
    netcat \
    curl \
    git \
    python3-pip \
    dnsutils \
    nbtscan-unixwiz \
    build-essential

# Install Python-based tools
echo "[+] Installing Python-based tools (Sublist3r, whatwaf, reconspider, spiderfoot)..."

# Install Sublist3r
if ! command -v sublist3r &>/dev/null; then
    echo "[+] Cloning and installing Sublist3r..."
    git clone https://github.com/aboul3la/Sublist3r.git ~/Sublist3r
    cd ~/Sublist3r && pip3 install -r requirements.txt && sudo ln -s ~/Sublist3r/sublist3r.py /usr/local/bin/sublist3r
    cd -
fi

# Install whatwaf
if ! command -v whatwaf &>/dev/null; then
    echo "[+] Cloning and installing whatwaf..."
    git clone https://github.com/Ekultek/WhatWaf.git ~/WhatWaf
    cd ~/WhatWaf && pip3 install -r requirements.txt && sudo ln -s ~/WhatWaf/whatwaf.py /usr/local/bin/whatwaf
    cd -
fi

# Install reconspider
if ! command -v reconspider &>/dev/null; then
    echo "[+] Cloning and installing reconspider..."
    git clone https://github.com/bhavsec/reconspider.git ~/reconspider
    cd ~/reconspider && pip3 install -r requirements.txt && sudo python3 setup.py install
    cd -
fi

# Install SpiderFoot
if ! command -v spiderfoot &>/dev/null; then
    echo "[+] Cloning and setting up SpiderFoot..."
    git clone https://github.com/smicallef/spiderfoot.git ~/spiderfoot
    sudo ln -s ~/spiderfoot/sf.py /usr/local/bin/spiderfoot
fi

echo ""
echo "✅ All tools installed successfully!"
echo "🚀 Now you can run ./hacklab.sh"
echo ""
