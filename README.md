# kali-dockerfile
My preferred Kali Linux Docker image customization. This will build a Kali Linux Docker image that contains these pentesting tools and resources:

- cadaver
- dirb
- exploitdb 
- exploitdb-bin-sploits 
- git 
- gdb 
- gobuster 
- hashcat 
- hydra 
- man-db 
- medusa 
- minicom 
- nasm 
- nikto 
- nmap 
- sqlmap 
- sslscan 
- webshells 
- wpscan 
- wordlists

Plus:
- ZSH shell with custom settings
- pciutils 
- usbutils
- Configure proxychains with Tor
- [SecLists](https://github.com/danielmiessler/SecLists)
- [PowerSploit](https://github.com/PowerShellMafia/PowerSploit)
- [hashcat](https://github.com/hashcat/hashcat)
- [LinEnum](https://github.com/rebootuser/LinEnum)
- [dirsearch](https://github.com/maurosoria/dirsearch)
- [sherlock](https://github.com/sdushantha/sherlock.git)


## Clone this repo

```
git clone https://github.com/willc/kali-dockerfile
```

## Build the image

```
docker build -t yourname/kali-rolling .
```

## Run it

This command will run the Docker image you built above, publish ports 80 and 443 to your host, and share your Desktop folder (as it resides on Macos; change path for other OS) with the running Docker image for easy file transfers in and out.

```
docker run -ti -p 80:80 -p 443:443 -v /Users/yourname/Desktop:/root yourname/kali-rolling
```
