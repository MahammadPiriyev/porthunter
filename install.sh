#!/usr/bin/env bash

set -e

echo "Installing PortHunter..."

REPO="mahammadpiriyev/porthunter"

curl -fsSL "https://raw.githubusercontent.com/$REPO/main/porthunter" -o /usr/local/bin/porthunter
chmod +x /usr/local/bin/porthunter

mkdir -p /usr/local/bin/lib

curl -fsSL "https://raw.githubusercontent.com/$REPO/main/lib/ports.sh" -o /usr/local/bin/lib/ports.sh
curl -fsSL "https://raw.githubusercontent.com/$REPO/main/lib/process.sh" -o /usr/local/bin/lib/process.sh

chmod +x /usr/local/bin/lib/*.sh

echo "Installed successfully!"
echo "Run: porthunter"