#!/data/data/com.termux/files/usr/bin/bash

echo "Installing sysinf scripts..."

# Create necessary directories
mkdir -p $HOME/bin/sysinf

# Download scripts from GitHub
base_url="https://raw.githubusercontent.com/JWDev60/ShellScripts/main/Termux/sysinf"

for script in sysinf net-inf software-inf hardware-inf; do
    curl -sLo $HOME/bin/sysinf/$script $base_url/$script
    chmod +x $HOME/bin/sysinf/$script
done

# Add to PATH
if ! grep -q 'export PATH=$HOME/bin/sysinf:$PATH' $HOME/.bashrc; then
    echo 'export PATH=$HOME/bin/sysinf:$PATH' >> $HOME/.bashrc
fi

source $HOME/.bashrc

echo "✅ sysinf installed successfully!"
echo "Run 'sysinf' to get system info."