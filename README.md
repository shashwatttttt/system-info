# 🛠️ System Information Report Script
🔎 Overview:-

This Bash script generates a detailed system report with key metrics about your system's health and performance. It can save the report locally or send it via email, making it a versatile tool for monitoring and diagnostics.
---
✨ Features

🔧 Comprehensive System Report:

- Hostname, OS, Kernel, and Architecture.

🔄 CPU and Memory Usage.

🔢 Disk Space Information.

🔐 Logged-in Users.

🔌 Network Interface Details.

🔅 Top Memory-Consuming Processes.

✉️ Email Integration:

- Prompts the user for an email address to send the report.

- Validate the provided email format.

- Sends the report using the mail command (if available).

🔍 Improved Usability:

- Saves the report locally to /tmp/system_report.txt.

- Clear and well-formatted output for easy readability.

- Graceful error handling for invalid email addresses or missing mail utility.

🔄 Extensible:

- Easily customizable to add more system metrics.

  ---

  🔧 How It Works

🔹 User Interaction:

The script asks if you want to send the report via email.

- Please make sure to send the report to the recipient's email.

🔹 Report Generation:

- Collects system metrics using commands like uname, uptime, free, df, ip, and ps.

- Formats the data into a structured report.

🔹 Email Delivery:

- Sends the report if a valid email is provided and the mail utility is installed.

- Saves the report locally if email is not an option.

🔹 Error Handling:

- Displays meaningful messages about the script’s progress and any issues encountered.

  ---

  🗊 Use Cases

🌐 System Monitoring:

- Keep track of resource usage and logged-in users.

🔧 Diagnostics and Troubleshooting:

- Share detailed system reports with administrators for debugging.

⏰ Automation:

- Schedule periodic reports with cron jobs and email them automatically.

  ---

  🔧 How to Use

🔢 Run the Script:

code :  ./system_report_final.sh

🔢 Follow the Prompts:

- Choose whether to send the report via email.

- Enter the recipient’s email address if required.

🔢 Access the Report:

- The report will be saved to /tmp/system_report.txt or sent to the specified email address.

  ---

  🎉 Why It’s Useful

🚀 Convenient: Combines all key metrics into a single report.

⚙️ Flexible: Option to save locally or share via email.

📊 Customizable: Easily adaptable for additional monitoring needs.

---
👨‍💻 Author

Developed with ❤️ by Shashwatttttt. 
Feel free to contribute or suggest improvements!
