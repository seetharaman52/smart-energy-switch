#!/usr/bin/env python3
import gi, subprocess
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
class MainApp(Gtk.Window):
    def __init__(self):
        Gtk.init([])
        Gtk.Window.__init__(self, title="GreenCharge Wizard")
        self.set_border_width(100)

        #---------------------Create a box to hold the label and the switch---------------------#

        main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        conserve_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)

        #---------------------Create labels---------------------#

        label1 = Gtk.Label(label="This GUI is only for Lenovo Laptops")
        label2 = Gtk.Label(label="Enable Conservation Mode:  ")
        label2.set_halign(Gtk.Align.START)

        #---------------------Create the switch---------------------#

        self.conserve_switch = Gtk.Switch()
        self.conserve_switch.set_active(self.load_conserve_mode())
        self.conserve_switch.connect("state-set", self.conserve_mode_toggled)

        #---------------------Add the label and the switch to the box---------------------#

        grid = Gtk.Grid()
        grid.attach(label2, 0, 0, 1, 1)
        grid.attach(self.conserve_switch, 1, 0, 1, 1)

        conserve_box.pack_start(grid, True, True, 0)
        
        main_box.pack_start(label1, True, True, 0)
        main_box.pack_start(conserve_box, True, True, 0)
        
        self.add(main_box)

    def load_conserve_mode(self):
        try:
            with open("/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode", "r") as conserve_mode:
                mode = conserve_mode.read().strip()
                return mode == "1"
        except FileNotFoundError:
            return False
    
    def conserve_mode_toggled(self, widget, state):
        conserve_mode_path = "/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
        if state:
            value = "1"
            action = "Enable"
        else:
            value = "0"
            action = "Disable"
        try:
    	    with open(conserve_mode_path, "w") as conserve_mode_file:
                conserve_mode_file.write(value)
        except Exception as e:
            print(f"An error occurred: {e}")

win = MainApp()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()