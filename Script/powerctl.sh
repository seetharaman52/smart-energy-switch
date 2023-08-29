#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 <1|0>"
    exit 1
fi
mode=$1
if [ "$mode" -eq 1 ]; then
    echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
    echo "Conservation mode enabled."
elif [ "$mode" -eq 0 ]; then
    echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
    echo "Conservation mode disabled."
else
    echo "Invalid argument. Please provide 1 to enable or 0 to disable."
    exit 1
fi
