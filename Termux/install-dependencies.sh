#!/data/data/com.termux/files/usr/bin/bash

# GitHub JSON File URL
JSON_URL="https://raw.githubusercontent.com/JWDev60/ShellScripts/main/Termux/dependencies.json"

# Function to display progress bar
show_progress() {
    local duration=$1
    local interval=1
    local progress=0
    while [ $progress -le 100 ]; do
        echo -n "#"
        sleep $interval
        ((progress+=10))
    done
    echo ""
}

echo "🔍 Fetching dependency list..."
DEPENDENCIES_JSON=$(curl -s "$JSON_URL")

# Check if JSON was retrieved
if [[ -z "$DEPENDENCIES_JSON" ]]; then
    echo "❌ Error: Could not fetch dependencies.json. Check your internet connection."
    exit 1
fi

# Ensure jq is installed (since we use it to parse JSON)
if ! command -v jq &>/dev/null; then
    echo "📦 Installing jq (required for JSON parsing)..."
    pkg install jq -y
fi

# Extract and display dependencies
echo "📜 Dependencies to install:"
echo "$DEPENDENCIES_JSON" | jq -r '.dependencies[] | " -