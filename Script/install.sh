#!/bin/bash
function error_exit {
  echo "Error: $1" >&2
  exit 1
}

function install_powerctl {
    cp powerctl /usr/local/bin/ || error_exit "Failed to copy powerctl to /usr/local/bin."
	chmod +x /usr/local/bin/powerctl || error_exit "Failed to set execute permissions on powerctl."
	echo "powerctl installed successfully to /usr/local/bin."
}

if [ -x /usr/local/bin/powerctl ]; then
	echo "powerctl is already installed."
 	exit 0
fi

read -p "Do you want to install powerctl? (Yes | No): " user_input
user_input=$(echo "$user_input" | tr '[:lower:]' '[:upper:]')
if [ "$user_input" = "YES" ]; then
	install_powerctl
elif [ "$user_input" = "NO" ]; then
	echo "You chose not to install powerctl! Bye!"
	exit
else
	error_exit "Invalid input. Please 'Yes' or 'No'."
fi
