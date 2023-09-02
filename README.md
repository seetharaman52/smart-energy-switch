# Power Control Script
### A Bash script to toggle energy-saving mode on your system (Especially for Lenovo Ideapad Operating on Linux OS)
`When turned on, Laptop will charge upto 60% only`
## Now Installation script is added!
1. Set executable permissions for the script install.sh:
   ```bash
   chmod +x install.sh
   
2. Execute the script in terminal:
   `Execute the script in sudo mode`
   ```bash
   sudo ./install.sh

## Manual Installation
1. Move the `powerctl.sh` script to the chosen directory. You can use the `mv` command:
   ```bash
   sudo cp /home/user/Downloads/smart-energy-switch-main/Script/powerctl.sh /usr/local/bin/
   
2. Set executable permissions for the script:
   ```bash
   chmod +x /usr/local/bin/powerctl.sh

## Adding the script to a local path (not recommended):
1. Decide on a directory where you want to store your custom scripts. A common choice is the `bin` directory in your home directory (`~/.bin`), assuming it's included in your PATH.

2. Check if the file is included in your path:
   ```bash
   whereis powerctl
3. If not included:
   ```bash
   sudo gedit ~/.bashrc
4. Go to last and add this line:
   ```bash
   export PATH="$PATH:$HOME/.bin"
5. Save and close the editor.
6. Now execute this command:
   ```bash
   source ~/.bashrc
7. That's it now it is included in yout path.

## Usage:
1. To enable power control:
   ```bash
   sudo powerctl.sh 1
2. To disable power control:
   ```bash
   sudo powerctl.sh 0
