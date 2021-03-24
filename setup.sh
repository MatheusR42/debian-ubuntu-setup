###############################################################################
#                                    DEBIAN                                   #
###############################################################################
# how to setup sudo:
# su -
# apt install sudo
# adduser {{username}} sudo
# exit

# nano /etc/apt/sources.list
# add this after all: non-free contrib

# sudo apt-get install firmware-atheros firmware-misc-nonfree
# sudo apt install gnome-shell-extension-autohidetopbar
# sudo apt install xserver-xorg-input-libinput xserver-xorg-input-evdev xserver-xorg-input-mouse
###############################################################################
#                                    DEBIAN                                   #
###############################################################################

sudo apt-get update

echo 'installing curl' 
sudo apt install curl -y

echo 'installing git' 
sudo apt install git -y

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Matheus Araujo\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"test@gmail.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo 'installing tool to handle clipboard via CLI'
sudo apt-get install xclip -y

export alias pbcopy='xclip -selection clipboard'
export alias pbpaste='xclip -selection clipboard -o'

echo 'installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

echo 'installing extensions'
code --install-extension Shan.code-settings-sync

echo 'installing fonts-firacode'
sudo apt install fonts-firacode -y

echo 'installing brave'
sudo apt install apt-transport-https gnupg -y
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install brave-browser -y 

echo 'installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'installing nvm' 
sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash)"

source ~/.bashrc
nvm --version
nvm install --lts
nvm use --lts
node --version
npm --version

echo 'installing docker' 
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

chmod 777 /var/run/docker.sock
docker run hello-world

echo 'installing docker-compose'
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo 'installing redshift'
sudo apt install redshift

echo 'installing yarn'
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn -y
echo 'export PATH="$PATH:$(yarn global bin)"' >> ~/.bashrc

echo 'installing VTEXIO'
yarn global add vtex

echo 'installing simplescreenrecorder'
sudo apt-get install simplescreenrecorder -y

echo 'installing audacity'
sudo add-apt-repository ppa:ubuntuhandbook1/audacity
sudo apt-get update
sudo apt-get install audacity -y

###############################################################################
#                                    SNAPS                                    #
###############################################################################
# echo 'installing postman'
# sudo snap install postman

# echo 'installing kdenlive'
# sudo snap install kdenlive

# echo 'installing discord'
# sudo snap install discord --classic

# echo 'installing heroku'
# sudo snap install --classic heroku

# echo 'installing spotify' 
# snap install spotify
###############################################################################
#                                    SNAPS                                    #
###############################################################################
