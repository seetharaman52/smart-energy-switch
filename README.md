# Power Control Script

## Note:
#### A Bash script to toggle energy-saving mode on your system (Especially for Lenovo Linux Laptops)

1. Decide on a directory where you want to store your custom scripts. A common choice is the `bin` directory in your home directory (`~/.bin`), assuming it's included in your PATH.

2. Move the `powerctl.sh` script to the chosen directory. You can use the `mv` command:
   ```bash
   mv powerctl.sh ~/.bin/
   
3. Set executable permissions for the script:
   ```bash
   chmod +x ~/.bin/powerctl.sh

## Adding the script to the path:
1. Check if the file is included in your path:
   ```bash
   whereis powerctl
2. If not included:
   ```bash
   sudo gedit ~/.bashrc
3. Go to last and add this line:
   ```bash
   export PATH="$PATH:$HOME/.bin"
4. Save and close the editor.
5. Now execute this command:
   ```bash
   source ~/.bashrc
7. That's it now it is included in yout path.

## Usage:
1. To enable power control:
   ```bash
   sudo powerctl.sh 1
3. To disable power control:
   ```bash
   sudo powerctl.sh 0
