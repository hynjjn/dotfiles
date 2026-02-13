#!/bin/bash

# Install Starship
if ! command -v starship &> /dev/null; then
    echo "🚀 Installing Starship..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# Install Antidote
if [ ! -d "$HOME/.antidote" ]; then
    echo "🧪 Installing Antidote..."
    git clone https://github.com/mattmc3/antidote.git "$HOME/.antidote"
fi

# Install NVM
if [ ! -d "$HOME/.nvm" ]; then
    echo "📦 Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi
