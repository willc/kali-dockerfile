# The latest Kali Linux base image
FROM kalilinux/kali-rolling
ARG DEBIAN_FRONTEND=noninteractive

# Update all the things
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get -y autoremove && apt-get clean

# Install ZSH shell with custom settings and set it as default shell
#RUN apt-get -y install git zsh wget && wget --no-check-certificate <https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh> -O - | /bin/bash
#COPY config/.zshrc /root/.zshrc
# Something changed upstream and the above stopped working. So the below works instead, for installing zsh:

RUN apt-get -y install git zsh wget curl && curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
RUN sh install.sh --unattended

# Update all the things again, then install my personal favorite tools
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get install -y cadaver dirb exploitdb exploitdb-bin-sploits git gdb gobuster hashcat hydra man-db medusa minicom nasm nikto nmap sqlmap sslscan webshells wpscan wordlists

# Install some useful hardware packages
RUN apt-get -y install pciutils usbutils

# Configure proxychains with Tor (optional if not using Tor)
COPY config/proxychains.conf /etc/proxychains.conf

# Create known_hosts for git cloning things I want to install (below)
RUN mkdir /root/.ssh
RUN touch /root/.ssh/known_hosts

# Add host keys
RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Clone git repos of things I like to have available
RUN git clone https://github.com/danielmiessler/SecLists /opt/seclists
RUN git clone https://github.com/PowerShellMafia/PowerSploit /opt/powersploit
RUN git clone https://github.com/hashcat/hashcat /opt/hashcat
RUN git clone https://github.com/rebootuser/LinEnum /opt/linenum
RUN git clone https://github.com/maurosoria/dirsearch /opt/dirsearch
RUN git clone https://github.com/sdushantha/sherlock.git /opt/sherlock

# Other installs of things I need
RUN apt-get install -y python3-pip
RUN pip install pwntools

# Update ENV
ENV PATH=$PATH:/opt/powersploit
ENV PATH=$PATH:/opt/hashcat
ENV PATH=$PATH:/opt/dirsearch
ENV PATH=$PATH:/opt/sherlock

# Set entrypoint and working directory (Mac specific)
WORKDIR /Users/willc/kali-vm/

# Expose ports 80 and 443 (you may not want to do this.)
EXPOSE 80/tcp 443/tcp
ENTRYPOINT ["/bin/zsh"]
