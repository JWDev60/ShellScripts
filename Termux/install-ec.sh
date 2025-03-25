#!/data/data/com.termux/files/usr/bin/bash

echo "Installing EC command for Termux..."

# Ensure the bin directory exists
mkdir -p $HOME/bin

# Create the EC script
cat > $HOME/bin/ec << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

clear

case "$1" in
    -h) ls -d .*/ */ ;;   # Show hidden directories
    -dd) ls -lh --group-directories-first ;;  # Show detailed directories
    *) ls -d */ ;;  # Default: Show standard directories
esac
EOF

# Give execution permission
chmod +x $HOME/bin/ec

# Add bin directory to PATH if not already in .bashrc
if ! grep -q 'export PATH=$HOME/bin:$PATH' $HOME/.bashrc; then
    echo 'export PATH=$HOME/bin:$PATH' >> $HOME/.bashrc
fi

# Apply changes
source $HOME/.bashrc

echo "EC command installed successfully! Use 'ec', 'ec -h', or 'ec -dd'."