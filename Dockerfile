# Kali Linux latest with useful tools by tsumarios
FROM kalilinux/kali-rolling

# Set working directory to /root
WORKDIR /root

# Update
RUN apt -y update && DEBIAN_FRONTEND=noninteractive apt -y dist-upgrade && apt -y autoremove && apt clean

# Install common and useful tools
RUN apt -y install curl wget vim git net-tools whois netcat-traditional pciutils usbutils

# Install useful languages
RUN apt -y install python3-pip golang nodejs npm

# Install Kali Linux "Top 10" metapackage and a few cybersecurity useful tools
RUN DEBIAN_FRONTEND=noninteractive apt -y install kali-tools-top10 exploitdb man-db dirb nikto wpscan uniscan lsof apktool dex2jar strace binwalk kali-tools-web zsh

# Install ZSH shell with custom settings and set it as default shell
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY config/.zshrc .

ENTRYPOINT ["/bin/zsh"]
