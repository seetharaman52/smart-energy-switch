#!/bin/bash
function error_exit {
  echo "Error: $1" >&2
  exit 1
}

function install_powerctl-gui {
    cp powerctl-gui /usr/local/bin/ || error_exit "Failed to copy powerctl-gui to /usr/local/bin."
	chmod +x /usr/local/bin/powerctl-gui || error_exit "Failed to set execute permissions on powerctl-gui."
	echo "powerctl-gui installed successfully to /usr/local/bin."
}

if [ -x /usr/local/bin/powerctl-gui ]; then
	echo "powerctl-gui is already installed."
 	exit 0
fi

read -p "Do you want to install powerctl-gui? (Yes | No): " user_input
user_input=$(echo "$user_input" | tr '[:lower:]' '[:upper:]')
if [ "$user_input" = "YES" ]; then
	install_powerctl-gui
elif [ "$user_input" = "NO" ]; then
	echo "You chose not to install powerctl-gui! Bye!"
	exit
else
	error_exit "Invalid input. Please 'Yes' or 'No'."
fi
