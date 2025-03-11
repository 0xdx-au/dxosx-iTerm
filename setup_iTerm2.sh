#!/bin/bash

# 📜 Script Kiddie MacOS Terminal Setup
# It will also roast you along the way. Enjoy. 😈

LOGFILE="$HOME/Desktop/terminal_setup_$(date +%Y%m%d%H%M%S).log"
exec > >(tee -a "$LOGFILE") 2>&1
echo "🔥 Logging installation to $LOGFILE..."

echo "💻 Checking if Homebrew is installed..."
if ! command -v brew >/dev/null 2>&1; then
  echo "🍺 Homebrew not found. Time to become a real hacker and install it..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
  source ~/.zshrc
else
  echo "✅ Homebrew is already installed. You're slightly less of a script kiddie.... nope... you still are.."
fi
brew -v

echo "🛠 Installing iTerm2..."
brew install --cask iterm2
echo "✅ iTerm2 installed. Now you have a real terminal instead of macOS' Fisher-Price default."

echo "🐍 Installing Ruby via Homebrew..."
brew install ruby
echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
ruby -v

echo "🕵️ Installing Oh-My-Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🎩 Installing Oh-My-Zsh, because real hackers don’t use Bash..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ Oh-My-Zsh already installed. Good, you're learning."
fi

echo "🎨 Installing Powerlevel10k..."
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo "✅ Powerlevel10k is already installed. You're catching up!"
fi
sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc || echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc

echo "🔌 Installing Zsh plugins (Syntax Highlighting & Autosuggestions)..."
ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting"
fi
if [ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git \
    "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions"
fi
sed -i '' 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc || echo 'plugins=(git zsh-syntax-highlighting zsh-autosuggestions)' >> ~/.zshrc

echo "🔠 Installing Hack Nerd Font..."
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
echo "✅ Font installed. Now your terminal will actually look good."

echo "🎨 Downloading Gruvbox Dark theme for iTerm2..."
curl -fsSL -o "$HOME/Downloads/GruvboxDark.itermcolors" \
  "https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/GruvboxDark.itermcolors"
open "$HOME/Downloads/GruvboxDark.itermcolors"
echo "✅ Gruvbox Dark theme applied. You're now officially a 1337 h4x0r."

echo "⚡ Configuring Powerlevel10k..."
P10K_CONFIG="$HOME/.p10k.zsh"
cat > "$P10K_CONFIG" <<'EOF'
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon host dir vcs prompt_char)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S %d/%m/%y}'
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VICMD_CONTENT_EXPANSION='❯'
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIVIS_CONTENT_EXPANSION='❯'
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIVIS_CONTENT_EXPANSION='❯'
typeset -g ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_PATTERNS+=('http://*' 'fg=cyan,underline')
ZSH_HIGHLIGHT_PATTERNS+=('https://*' 'fg=cyan,underline')
[[ ! -f /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme ]] || source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
EOF
echo '[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh' >> "$HOME/.zshrc"

echo "🌈 Installing colorls..."
gem install colorls
echo "✅ colorls installed. Your `ls` command is now **colorful and fabulous**."

echo "🚀 Creating alias for colorful `ls`..."
echo "alias ls='colorls --sd'" >> ~/.zshrc
echo "alias ll='colorls -l'" >> ~/.zshrc

echo "✅ **Terminal setup complete!** 🎉"
echo " » **Final steps:**"
echo "  1️⃣ Open iTerm2, go to Preferences → Profiles → Text, and set the font to 'Hack Nerd Font'."
echo "  2️⃣ In Preferences → Profiles → Colors, select 'Gruvbox Dark'."
echo "  3️⃣ If your prompt looks wrong, run: p10k configure"
echo "  4️⃣ Restart iTerm2 and enjoy your **hacker aesthetic**!"
echo "🔥 Script Kiddie status: REDUCED. You're now at least a junior hacker. NAHHHHT"

exec zsh
