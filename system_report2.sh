#!/bin/bash

# Script: System Information Report
# Description: Generates a detailed system report and optionally emails it.
# Author: shashwatttttt
# Version: 3.0

# Configuration
OUTPUT_FILE="/tmp/system_report.txt"
TIME_FORMAT=$(date +"%Y-%m-%d %H:%M:%S")

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Prompt for email address
prompt_email() {
    echo "Would you like to send the report via email? (yes/no): "
    read -r send_email
    if [[ "$send_email" =~ ^[Yy](es)?$ ]]; then
        echo "Enter the recipient's email address: "
        read -r EMAIL
        if [[ "$EMAIL" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
            echo "Email will be sent to: $EMAIL"
        else
            echo "Invalid email address. Skipping email step."
            EMAIL=""
        fi
    else
        echo "Skipping email step."
        EMAIL=""
    fi
}

# Start the report
generate_report() {
    {
        echo "============================================"
        echo "         SYSTEM INFORMATION REPORT           "
        echo "   Generated on: $TIME_FORMAT"
        echo "============================================"
        echo ""

        # Basic System Information
        echo "Basic System Information:"
        echo "  Hostname: $(hostname)"
        echo "  OS: $(lsb_release -d | cut -f2-)"
        echo "  Kernel: $(uname -r)"
        echo "  Architecture: $(uname -m)"
        echo ""

        # System Uptime and Load Average
        echo "System Uptime and Load Average:"
        uptime
        echo ""

        # CPU Usage
        echo "CPU Usage:"
        top -bn1 | grep "Cpu(s)" | awk '{print "  Usage: " $2 + $4 "%"}'
        echo ""

        # Memory Usage
        echo "Memory Usage:"
        free -h | awk '/^Mem/ {print "  Total: "$2"\n  Used: "$3"\n  Free: "$4}'
        echo ""

        # Disk Space
        echo "Disk Space Usage:"
        df -h --total | awk '/^Filesystem|total/ {print "  "$0}'
        echo ""

        # Network Information
        echo "Network Information:"
        ip -br addr show | awk '{print "  Interface: "$1", IP Address: "$3}'
        echo ""

        # Logged-in Users
        echo "Logged-in Users:"
        who
        echo ""

        # Running Processes
        echo "Top 5 Memory-Consuming Processes:"
        ps aux --sort=-%mem | awk 'NR<=5 {printf "  %-8s %-8s %-5s %s\n", $1, $2, $4"%", $11}'
        echo ""

        echo "============================================"
        echo "       END OF SYSTEM INFORMATION REPORT      "
        echo "============================================"
    } > "$OUTPUT_FILE"
}

# Email the report if an email address is provided
send_report_via_email() {
    if [[ -n "$EMAIL" ]]; then
        if command_exists mail; then
            echo "Sending report via email to $EMAIL..."
            mail -s "System Information Report for $(hostname)" "$EMAIL" < "$OUTPUT_FILE"
            if [ $? -eq 0 ]; then
                echo "Report sent successfully."
            else
                echo "Failed to send email. Please check your mail configuration."
            fi
        else
            echo "Mail command not found. Skipping email step."
        fi
    else
        echo "No valid email provided. Report saved locally at $OUTPUT_FILE."
    fi
}

# Main Script Execution
echo "Starting System Information Report..."
prompt_email
generate_report
send_report_via_email

echo "System report generation complete!"
