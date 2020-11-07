#!/bin/bash
sudo apt -y update
sudo apt -y upgrade

sudo apt install -y libcurl4-openssl-dev
sudo apt install -y libssl-dev
sudo apt install -y jq
sudo apt install -y ruby-full
sudo apt install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt install -y build-essential libssl-dev libffi-dev python-dev
sudo apt install -y python-setuptools
sudo apt install -y libldns-dev
sudo apt install -y python3-pip
sudo apt install -y python-pip
sudo apt install -y python-dnspython
sudo apt install -y git
sudo apt install -y rename
sudo apt install -y xargs
sudo apt install -y unzip

datetime=$(date '+%d/%m/%Y %H:%M:%S')

#install go
if [[ -z "$GOPATH" ]];then
echo "[$datetime] - Golang is not installed, would you like to install it now?"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
					sudo tar -xvf go1.14.4.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo "export GOROOT=/usr/local/go" >> ~/.bash_profile
					echo "export GOPATH=$HOME/go"	>> ~/.bash_profile			
					echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> "$HOME"/.bash_profile	
					source ~/.bash_profile
					sleep 2
					break
					;;
				no)
					echo "[$datetime] - Please install go and rerun this script. Some tools does not work whithout Go!"
					echo "[$datetime] - Aborting Golang installation..."
					break
					;;
	esac	
done
fi


#create a tools folder in ~/
mkdir ~/tools && cd ~/tools

#install aquatone
echo "[$datetime] - Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "[$datetime] - done"

# install gobuster
echo "[$datetime] - installing Gobuster"
go get github.com/OJ/gobuster
echo "[$datetime] - done"

echo "[$datetime] - installing Ffuf"
go get github.com/ffuf/ffuf
echo "[$datetime] - done"

#install chromium
echo "[$datetime] - Installing Chromium"
sudo snap install chromium
echo "[$datetime] - done"

echo "[$datetime] - installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing PowerSploit"
git clone https://github.com/PowerShellMafia/PowerSploit.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing LFISuite"
git https://github.com/D35m0nd142/LFISuite.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing ADAPE"
git clone https://github.com/hausec/ADAPE-Script.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing JAWS"
git clone https://github.com/411Hall/JAWS.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing Windows Exploit Suggester - Next Generation"
git clone https://github.com/bitsadmin/wesng.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing Windows-Exploit-Suggester"
git clone https://github.com/bitsadmin/wesng.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing BeRoot"
git clone https://github.com/AlessandroZ/BeRoot.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing Wafw00f"
git clone https://github.com/enablesecurity/wafw00f.git
cd wafw00f/
python setup.py install
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing Linux Smart Enumiration Tool"
wget "https://github.com/diego-treitos/linux-smart-enumeration/raw/master/lse.sh" -O lse.sh
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing FuzzDB"
git clone https://github.com/fuzzdb-project/fuzzdb.git --depth 1
cd fuzzdb*
git pull
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing Impacket Scripts"
git clone https://github.com/SecureAuthCorp/impacket.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing CrackMapExec"
git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec
cd CrackMapExec
sudo python3 setup.py install
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing Lynis"
git clone https://github.com/CISOfy/lynis
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing LinEnum"
git clone https://github.com/rebootuser/LinEnum.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing Linux-Exploit-Suggester"
git clone https://github.com/jondonas/linux-exploit-suggester-2.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing Privilege Escalation Awesome Scripts SUITE"
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing PSPY"
mkdir PSPY && cd PSPY
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32s
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64s
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing Nishang Scripts"
git clone https://github.com/samratashok/nishang.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing Mimikatz"
mkdir Mimikatz && cd Mimikatz
wget https://github.com/gentilkiwi/mimikatz/releases/download/2.2.0-20200519/mimikatz_trunk.zip
unzip mimikatz_trunk.zip
rm *.zip
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing Sherlock"
git clone https://github.com/sherlock-project/sherlock.git
cd sherlock && sudo pip3 install -r requirements.txt
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
sudo pip install -r requirements.txt
cd ~/tools
echo "[$datetime] - done"


echo "[$datetime] - installing teh_s3_bucketeers"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/tools
echo "[$datetime] - done"


echo "[$datetime] - installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && sudo bundle install --without test
cd ~/tools
echo "[$datetime] - done"

echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools
echo "[$datetime] - done"


echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git
cd ~/tools
echo "[$datetime] - done"

echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools
echo "[$datetime] - done"


echo "[$datetime] - installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing nmap"
sudo apt install -y nmap
echo "[$datetime] - done"

echo "[$datetime] - installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
sudo pip install -r requirements.txt
cd ~/tools
echo "[$datetime] - done"

echo "[$datetime] - installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "[$datetime] - done"

echo "[$datetime] - installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "[$datetime] - done"

echo "[$datetime] - installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

echo "[$datetime] - installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git
echo "[$datetime] - done"

echo "[$datetime] - downloading Seclists"
cd ~/tools
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools
echo "[$datetime] - done"

echo -e "\nDone! All tools are set up in $HOME/PentestStuff"
ls -la
