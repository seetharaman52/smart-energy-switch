#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script needs superuser privileges. Please run it with sudo."
    exit 1
fi

original_user="$SUDO_USER"

echo
echo "---------------Installing GreenCharge Wizard---------------"
# total_iterations=100
# progress-bar() {
#   echo
#   local duration=${1}
#     already_done() { for ((done=0; done<$elapsed; done++)); do printf "▇"; done }
#     remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
#     percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
#     clean_line() { printf "\r"; }
#   for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
#       already_done; remaining; percentage
#       sleep 0.050
#       clean_line
#   done
#   clean_line
# }
# progress-bar $total_iterations
echo
current_dir=$(pwd)
available_local=$(ls /home/$original_user/.local/share/applications/ | grep 'GreenCharge-Wizard.desktop')
available_opt=$(ls /opt/ | grep 'GreenCharge-Wizard')
if [ -z "$available_local" ]
then
    echo
    echo "Making a directory GreenCharge-Wizard/ in /usr/share/icons/"
    sudo mkdir /usr/share/icons/GreenCharge-Wizard
    echo "Copying icon to /usr/share/icons/GreenCharge-Wizard/"
    cp 'icon.png' /usr/share/icons/GreenCharge-Wizard/
    echo "Copying .desktop file to /home/$original_user/.local/share/applications/"
    cp $current_dir/GreenCharge-Wizard.desktop /home/$original_user/.local/share/applications/
    chmod +x /home/$original_user/.local/share/applications/GreenCharge-Wizard.desktop
fi

if [ -z "$available_opt" ]
then
    echo
    echo "Making a directory GreenCharge-Wizard/ in /opt/"
    sudo sudo mkdir /opt/GreenCharge-Wizard
    echo "Copying files to /opt/GreenCharge-Wizard/"
    cp -r $current_dir/* /opt/GreenCharge-Wizard/
    chmod +x /opt/GreenCharge-Wizard/run-app.sh
fi


