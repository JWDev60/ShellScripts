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

# Extract script names and descriptions
SCRIPT_NAMES=()
SCRIPT_DESCRIPTIONS=()
SCRIPT_URLS=()

while read -r SCRIPT; do
    DESCRIPTION=$(echo "$SCRIPTS_JSON" | jq -r --arg key "$SCRIPT" '.scripts[$key].description')
    URL=$(echo "$SCRIPTS_JSON" | jq -r --arg key "$SCRIPT" '.scripts[$key].install_url')

    SCRIPT_NAMES+=("$SCRIPT")
    SCRIPT_DESCRIPTIONS+=("$DESCRIPTION")
    SCRIPT_URLS+=("$URL")
done < <(echo "$SCRIPTS_JSON" | jq -r '.scripts | keys[]')

echo "📜 Available Scripts:"
echo "----------------------"

# Display the scripts
for i in "${!SCRIPT_NAMES[@]}"; do
    echo "$((i+1))) ${SCRIPT_NAMES[$i]} - ${SCRIPT_DESCRIPTIONS[$i]}"
done

EXIT_OPTION=$(( ${#SCRIPT_NAMES[@]} + 1 ))
echo "$EXIT_OPTION) Exit"

# Get user choice
echo ""
read -p "Enter the number of the script to install: " CHOICE

# Handle exit
if [[ "$CHOICE" -eq "$EXIT_OPTION" ]]; then
    echo "Exiting..."
    exit 0
fi

# Validate choice
if [[ "$CHOICE" -lt 1 || "$CHOICE" -gt "${#SCRIPT_NAMES[@]}" ]]; then
    echo "❌ Invalid selection!"
    exit 1
fi

# Get installation URL
INSTALL_URL="${SCRIPT_URLS[$((CHOICE-1))]}"

# Run the installation script
echo "Installing ${SCRIPT_NAMES[$((CHOICE-1))]}..."
curl -sL "$INSTALL_URL" | bash

echo "✅ Installation completed!"