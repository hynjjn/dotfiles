#!/bin/bash

# --- Install Zsh and set as default ---
if ! command -v zsh &> /dev/null; then
    echo "🐚 Installing Zsh..."
    
    # Detect OS/Package Manager
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS usually has Zsh, but this ensures it's handled if using Homebrew
        brew install zsh
    elif [ -f /etc/debian_version ]; then
        sudo apt update && sudo apt install -y zsh
    elif [ -f /etc/fedora-release ]; then
        sudo dnf install -y zsh
    elif [ -f /etc/arch-release ]; then
        sudo pacman -S --noconfirm zsh
    else
        echo "❌ Unknown OS. Please install Zsh manually."
        exit 1
    fi
fi

# Set Zsh as the default shell if it isn't already
if [[ "$SHELL" != *"zsh"* ]]; then
    echo "✅ Setting Zsh as the default shell..."
    chsh -s "$(which zsh)"
    echo "Note: You may need to log out and back in for the shell change to take effect."
fi

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
