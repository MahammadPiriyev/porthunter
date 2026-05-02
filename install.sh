#!/usr/bin/env bash

set -e

echo "Installing PortHunter..."

REPO="mahammadpiriyev/porthunter"
INSTALL_DIR="$HOME/.local/bin"
LIB_DIR="$INSTALL_DIR/lib"

mkdir -p "$INSTALL_DIR"
mkdir -p "$LIB_DIR"

# Main CLI
curl -fsSL "https://raw.githubusercontent.com/$REPO/main/porthunter" \
-o "$INSTALL_DIR/porthunter"

chmod +x "$INSTALL_DIR/porthunter"

# Lib files
curl -fsSL "https://raw.githubusercontent.com/$REPO/main/lib/ports.sh" \
-o "$LIB_DIR/ports.sh"

curl -fsSL "https://raw.githubusercontent.com/$REPO/main/lib/process.sh" \
-o "$LIB_DIR/process.sh"

chmod +x "$LIB_DIR"/*.sh

echo ""
echo "Installed successfully!"
echo ""

echo "IMPORTANT: add this to your PATH if not added yet:"
echo 'export PATH="$HOME/.local/bin:$PATH"'

echo ""
echo "Run: porthunter"