#!/data/data/com.termux/files/usr/bin/bash

# GitHub JSON File URL
JSON_URL="https://raw.githubusercontent.com/JWDev60/ShellScripts/main/Termux/scripts.json"

# Fetch script list
echo "Fetching available scripts..."
SCRIPTS_JSON=$(curl -s "$JSON_URL")

# Check if JSON was retrieved
if [[ -z "$SCRIPTS_JSON" ]]; then
    echo "❌ Error: Could not fetch scripts.json. Check your internet connection or JSON file."
    exit 1
fi

# Extract script names
SCRIPT_NAMES=$(echo "$SCRIPTS_JSON" | jq -r '.scripts | keys[]')

echo "📜 Available Scripts:"
echo "----------------------"

# Display the scripts
INDEX=1
declare -A SCRIPT_MAP
while read -r SCRIPT; do
    DESC=$(echo "$SCRIPTS_JSON" | jq -r --arg key "$SCRIPT" '.scripts[$key].description')
    echo "$INDEX) $SCRIPT - $DESC"
    SCRIPT_MAP[$INDEX]="$SCRIPT"
    ((INDEX++))
done <<< "$SCRIPT_NAMES"

echo "$INDEX) Exit"

# Get user choice
echo ""
read -p "Enter the number of the script to install: " CHOICE

# Handle exit
if [[ "$CHOICE" -eq "$INDEX" ]]; then
    echo "Exiting..."
    exit 0
fi

# Validate choice
SELECTED_SCRIPT=${SCRIPT_MAP[$CHOICE]}
if [[ -z "$SELECTED_SCRIPT" ]]; then
    echo "❌ Invalid selection!"
    exit 1
fi

# Get installation URL
INSTALL_URL=$(echo "$SCRIPTS_JSON" | jq -r --arg key "$SELECTED_SCRIPT" '.scripts[$key].install_url')

# Run the installation script
echo "Installing $SELECTED_SCRIPT..."
curl -sL "$INSTALL_URL" | bash

echo "✅ Installation completed!"