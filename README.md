# Power Control Script
### A Bash script to toggle energy-saving mode on your system 
`Especially for Lenovo Ideapad Operating on Linux OS`<br>
`When turned on, Laptop will charge upto 60% only`
## Now Installation script is added!
1. Set executable permissions for the installation script:
   * <b>For CLI</b>
      ```bash
      chmod +x install.sh
   
   * <b>For GUI</b>
      ```bash
      chmod +x install-gui.sh
   
2. Execute the script in terminal:
#### `Execute the script in sudo mode`
   * <b>For CLI</b>
      ```bash
      sudo ./install.sh
   
   * <b>For GUI</b>
      ```bash
      sudo ./install-gui.sh
   
## Usage for CLI:
1. To enable power control:
   ```bash
   sudo powerctl 1
2. To disable power control:
   ```bash
   sudo powerctl 0

## Usage for GUI:
1. To enable power control:
   ```bash
   sudo powerctl-gui
