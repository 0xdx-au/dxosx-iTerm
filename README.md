# **MacOS Hacker-Themed Terminal Setup (Powerlevel10k, iTerm2, Gruvbox)**
🚀 **Fully Automated macOS Terminal Customization**  
This script **automatically** sets up a **hacker-style terminal** with **Powerlevel10k**, **iTerm2**, **Gruvbox Dark theme**, and more.

---

## **📌 Features**
✅ **iTerm2 installed via Homebrew** (ensures up-to-date version)  
✅ **Powerlevel10k Theme** (with hostname, Apple logo, 24h time, date)  
✅ **Syntax Highlighting & Autosuggestions** (green = valid, red = errors)  
✅ **Colored & Iconized `ls` Output** (`colorls` for better directory view)  
✅ **Gruvbox Dark Theme** for iTerm2 (hacker-style appearance)  
✅ **Installs Hack Nerd Font** (for prompt icons & glyphs)  
✅ **Ensures macOS Uses Homebrew’s Latest Ruby** (fixes `colorls` issues)  
✅ **Automates All Installs & Configurations** (just run one script!)

---

## **📥 Installation**
### **1️⃣ Install Homebrew (if not already installed)**
If you don’t have Homebrew, install it:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Then ensure it's available in your shell:
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
source ~/.zshrc
```

### **2️⃣ Install iTerm2 via Homebrew**
```bash
brew install --cask iterm2
```

### **3️⃣ Download & Run the Setup Script**
Clone the repository and run the script:
```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
chmod +x setup_terminal.sh
./setup_terminal.sh
```

This will:
- Install **Zsh, Oh-My-Zsh, Powerlevel10k, Ruby, colorls**.
- Enable **syntax highlighting, autosuggestions**.
- Apply the **Gruvbox Dark color scheme** to iTerm2.
- Configure **Powerlevel10k** with the correct settings.

---

## **🛠 Manual Tweaks (After Install)**
Some iTerm2 settings must be manually adjusted:

### **🔹 1. Set iTerm2 Font**
1. Open **iTerm2 → Preferences → Profiles → Text**.
2. Click **Change Font**.
3. Select **Hack Nerd Font** (installed by script).
4. Set **both ASCII and Non-ASCII fonts** to the same Nerd Font.

### **🔹 2. Apply Gruvbox Dark Theme**
1. **iTerm2 → Preferences → Profiles → Colors**.
2. Click **Color Presets…** (bottom-right).
3. Choose **Gruvbox Dark**.

---

## **📷 Preview**
*(Add screenshots of the finished terminal setup here!)*

---

## **📦 Uninstallation**
If you want to remove all customizations, run:
```bash
rm -rf ~/.oh-my-zsh ~/.zshrc ~/.p10k.zsh ~/.config/powerlevel10k
brew uninstall --cask iterm2
brew uninstall colorls
```

---

## **💡 FAQ**
### **Q: I ran the script, but my terminal still looks weird.**
✅ Run:
```bash
exec zsh
```
✅ If Powerlevel10k still doesn’t load, try:
```bash
p10k configure
```

### **Q: My prompt icons look broken.**
Make sure you set **Hack Nerd Font** in iTerm2 (**Profiles → Text → Font**).

---

## **💻 Contributing**
Feel free to **fork** this repo and submit a **pull request** with improvements!

---

## **📜 License**
MIT License – Use, modify, and share freely!

---

### **🚀 Enjoy Your iTerm2!**
Now, every time you open iTerm2, you’ll feel like a real twat. 😎

---
