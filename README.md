# Power Control Script

## Note:
### A Bash script to toggle energy-saving mode on your system (Especially for Lenovo Linux Laptops)

1. Decide on a directory where you want to store your custom scripts. A common choice is the `bin` directory in your home directory (`~/.bin`), assuming it's included in your PATH.

2. Move the `powerctl.sh` script to the chosen directory. You can use the `mv` command:
   ```bash
   mv powerctl.sh ~/.bin/

## Usage:
1. To enable power control:
   ```sudo powerctl.sh 1```
2. To disable power control:
   `sudo pwerctl.sh 2`
