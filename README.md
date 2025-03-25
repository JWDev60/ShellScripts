# ShellScripts

A collection of useful shell scripts for **Termux** and standard Linux distributions.  

---

## 📜 Available Scripts  

### **1. Easy Clear (`ec`) for Termux**  
A simple command that clears the terminal and lists directories.  

#### **Installation**  
Run the following command in Termux:  
```bash
curl -sL https://raw.githubusercontent.com/JWDev60/ShellScripts/main/Termux/install-ec.sh | bash

Usage

ec      # Clears terminal and lists standard directories  
ec -h   # Lists hidden directories  
ec -dd  # Lists directories with details


---

2. System Info (sysinf) for Termux

Displays system-related information, including network, software, and hardware details.

Installation

Run the following command in Termux:

curl -sL https://raw.githubusercontent.com/JWDev60/ShellScripts/main/Termux/install-sysinf.sh | bash

Usage

sysinf        # Shows menu to pick an option  
sysinf -a     # Runs all info scripts  
sysinf -n     # Runs network info only  
sysinf -s     # Runs software info only  
sysinf -h     # Runs hardware info only


---

📂 Repository Structure

ShellScripts/
│── Termux/
│   ├── ec/                  # Easy Clear script
│   │   ├── install-ec.sh    # EC installer
│   ├── sysinf/              # System Info scripts
│   │   ├── sysinf          # Main system info script
│   │   ├── net-inf         # Network info script
│   │   ├── software-inf    # Software info script
│   │   ├── hardware-inf    # Hardware info script
│   ├── install-sysinf.sh   # System info installer
│── Linux/                  # Placeholder for future Linux scripts
│── README.md


---

⚡ Contributing

Feel free to fork this repository and submit pull requests with new scripts or improvements.


---

📜 License

This project is open-source under the MIT License.


---

🚀 Enjoy scripting with Termux!

This README is structured to make it easy to understand and navigate. Let me know if you want any modifications!

