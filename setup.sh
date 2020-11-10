## Programer: Kuton no Z3R0
# 11/11/2020

# Caching Errors
set -o errexit

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

show_menu() {
    normal=$(echo "\033[m")
    menu=$(echo "\033[36m")   #Blue
    number=$(echo "\033[33m") #yellow
    bgred=$(echo "\033[41m")
    fgred=$(echo "\033[31m")
    echo
    echo " Media Server Setup "
    echo
    printf " Please select a Exporters"
    printf "\n ${menu}*********************************************${normal}\n"
    printf "   ${number} 1)${menu} Server Configuration ${normal}\n"
    printf "   ${number} 2)${menu} Install Samba ${normal}\n"
    printf "   ${number} 3)${menu} Download Media Compose Repo${normal}\n"
    printf " ${menu}*********************************************${normal}\n"
    printf " Please enter a menu option and enter ${fgred}(or x to exit)${normal}: "
    read opt </dev/tty
}

option_picked() {
    msgcolor=$(echo "\033[01;31m") # bold red
    normal=$(echo "\033[00;00m")   # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

sources_update() {

    # Variables
    read -p 'Please enter a User Name: ' USERNAME
    read -p 'Please enter a Group Name: ' GROUPNAME

    cp /etc/apt/sources.list /etc/apt/sources.list.bk

    cat <<EOF >>/etc/apt/sources.list

# Latest Security Updates
deb http://deb.debian.org/debian-security/ buster/updates main contrib non-free

EOF

    apt -y update && apt -y upgrade
}

package_install() {

    packages='sudo curl nfs-kernel-server nfs-common cifs-utils cockpit cockpit-networkmanager cockpit-packagekit tree libffi-dev libssl-dev python3 python3-pip' # List of packages

    for p in ${packages}; do
        apt install -y ${packages}
    done
}

folders_creation() {

    mkdir -p /home/Data/Storage

    cd /home/Data/Storage/

    mkdir Downloads Music Movies Anime Others 'Tv Shows'

    #========================================================

    mkdir /home/Data/Config

    cd /home/Data/Config/

    mkdir Plex Tautulli OMBI NextCloud .BitWarden PiHole WireGuard

    # Folder Configuracion
    if [ $(getent group ${GROUPNAME}) ]; then
        chown -R ${USERNAME}:${GROUPNAME} /home/Data # Own by root and adding to group
    else
        groupadd ${GROUPNAME}
        chown -R ${USERNAME}:${GROUPNAME} /home/Data
    fi

    chmod -R 770 /home/Data # Assigning read write and execute permissions
}

docker_install() {

    curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
    service docker enable
    pip3 install docker-compose
}

user_verification() {

    #usermod -aG docker ${USERNAME}

    if [ $(getent passwd ${USERNAME}) ]; then

        if [ $(getent group ${GROUPNAME}) ]; then
            usermod -aG ${GROUPNAME},sudo,docker ${USERNAME}
        else
            groupadd ${GROUPNAME}
            usermod -aG ${GROUPNAME},sudo,docker ${USERNAME}
        fi

        echo "the user ${USERNAME} was add it to sudo, ${GROUPNAME} and docker group"
    fi
}

samba_conf() {

    # Variables
    read -p 'Please enter a User Name: ' USERNAME
    read -p 'Please enter a Group Name: ' GROUPNAME

    apt install -y samba

    cp /etc/samba/smb.conf /etc/samba/smb.conf.bk

    cat <<EOF >>/etc/samba/smb.conf

[Data]
  comment = Server Data Container and Media
  path = /home/Data
  valid users = @${GROUPNAME}
  guest ok = no
  writable = yes
  browsable = yes
EOF

    /etc/init.d/smbd restart

    echo
    echo
    echo "Samba Share Folder configuration"

    tail -7 /etc/samba/smb.conf

    echo
    echo
    echo "Remember to create a samba password with this command"
    echo
    option_picked "smbpasswd -a ${USERNAME}"
    echo

    #testparm
    sleep 10
}

testing() {

    # testing Docker
    echo
    echo =============================== Docker Version ================================
    echo

    docker version

    echo
    echo =========================== Docker Machine Version ============================
    echo

    docker-compose version

    echo
    echo =========================== Samba Shares Version ============================
    echo

    # Cleaning
    apt -y clean && apt -y autoclean

    clear
    tree /home/Data

    id ${USERNAME} | grep sudo
    id ${USERNAME} | grep docker
    id ${USERNAME} | grep ${GROUPNAME}

    sleep 5
}

#main
clear
show_menu
while [ ! -z $opt ]; do
    if [ -z $opt ]; then
        exit
    else
        case $opt in
        1)
            clear
            option_picked "Setting up the Media Server"
            printf "${menu}*********************************************${normal};\n\n"

            sources_update
            package_install
            folders_creation
            docker_install
            user_verification
            testing

            clear
            show_menu
            ;;
        2)
            clear
            option_picked "Installing Samba"
            printf "${menu}*********************************************${normal};\n\n"

            samba_conf

            clear
            show_menu
            ;;
        3)
            cd /home/Data/Config
            git clone https://github.com/KutonnoZer0/MediaCompose.git
            ;;
        x)
            exit
            ;;
        \n)
            exit
            ;;
        *)
            clear
            option_picked "Pick an option from the menu"
            show_menu
            ;;
        esac
    fi
done
