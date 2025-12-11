# GitHub Codespaces Dotfiles Demo

## What are Dotfiles?

**Dotfiles** are configuration files (starting with a dot `.`) that personalize your development environment:
- `.bashrc` or `.zshrc` - Shell configuration
- `.gitconfig` - Git settings
- `.vimrc` - Vim editor settings
- `.aliases` - Custom command aliases
- And many more!

**Why use Dotfiles in Codespaces?**
- 🚀 Consistent environment across all your Codespaces
- ⚙️ Automatic setup - no manual configuration
- 🔧 Your tools, aliases, and preferences everywhere
- 💼 Professional workflow on any machine

---

## Part 1: Create Your Dotfiles Repository

### Step 1: Create a Dotfiles Repository on GitHub

1. Go to GitHub
2. Click **"+"** → **"New repository"**
3. Repository name: **`dotfiles`** (must be exactly this name)
4. Description: "My personal development environment configuration"
5. Make it **Public** or **Private** (your choice)
6. ✅ Check "Add a README file"
7. Click **"Create repository"**

**Important:** GitHub Codespaces automatically looks for a repository named `dotfiles` in your account!

---

### Step 2: Clone Your Dotfiles Repository

```pwsh
cd ~
git clone https://github.com/YOUR-USERNAME/dotfiles.git
cd dotfiles
```

---

### Step 3: Create Basic Dotfiles

#### Create `.gitconfig`

This configures Git with your preferences:

```bash
# Create .gitconfig
cat > .gitconfig << 'EOF'
[user]
    name = Your Name
    email = your.email@example.com

[core]
    editor = code --wait
    autocrlf = input

[alias]
    # Shortcuts
    st = status
    co = checkout
    br = branch
    ci = commit
    unstage = reset HEAD --
    
    # Pretty logs
    lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
    
    # Show last commit
    last = log -1 HEAD
    
    # List aliases
    aliases = config --get-regexp alias

[color]
    ui = auto

[pull]
    rebase = false
EOF
```

#### Create `.bash_aliases`

Custom command shortcuts:

```bash
# Create .bash_aliases
cat > .bash_aliases << 'EOF'
# Navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias glog='git log --oneline --graph --decorate'

# Listing files
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Safety nets
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Quick edits
alias editbash='code ~/.bashrc'
alias reload='source ~/.bashrc'

# Development
alias dev='cd ~/workspace'
alias serve='python3 -m http.server 8000'

# Show current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Custom prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$ '
EOF
```

#### Create `.bashrc_custom`

Custom bashrc additions:

```bash
# Create .bashrc_custom
cat > .bashrc_custom << 'EOF'
# Custom Bashrc for Codespaces

# Load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Environment variables
export EDITOR='code --wait'
export VISUAL='code --wait'

# Color support
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# History settings
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:erasedups

# Append to history instead of overwriting
shopt -s histappend

# Welcome message
echo '🚀 Welcome to your personalized Codespace!'
echo '📁 Workspace: '$(pwd)
echo '🔧 Dotfiles loaded successfully'
echo ''
EOF
```

#### Create `install.sh` (Setup Script)

This script runs automatically when a Codespace starts:

```bash
# Create install.sh
cat > install.sh << 'EOF'
#!/bin/bash

echo "🔧 Setting up your personalized environment..."

# Debug: Show where we are
echo "Current directory: $(pwd)"
echo "Home directory: $HOME"
echo "Dotfiles should be at: $HOME/dotfiles"

# Check if dotfiles directory exists
if [ ! -d "$HOME/dotfiles" ]; then
    echo "❌ Dotfiles directory not found at $HOME/dotfiles"
    echo "This script should be run from the dotfiles directory or dotfiles should be in HOME"
    exit 1
fi

# Backup existing configs
backup_if_exists() {
    if [ -f "$1" ]; then
        echo "📦 Backing up existing $1 to $1.backup"
        mv "$1" "$1.backup"
    fi
}

# Link dotfiles
link_dotfile() {
    source_file="$HOME/dotfiles/$1"
    target_file="$HOME/$1"
    
    if [ -f "$source_file" ]; then
        backup_if_exists "$target_file"
        echo "🔗 Linking $1"
        ln -sf "$source_file" "$target_file"
    else
        echo "⚠️  $source_file not found, skipping"
    fi
}

# Link all dotfiles
link_dotfile ".gitconfig"
link_dotfile ".bash_aliases"

# Append custom bashrc to existing .bashrc
if [ -f "$HOME/dotfiles/.bashrc_custom" ]; then
    echo "✨ Adding custom bashrc settings"
    
    # Check if already added (to avoid duplicates)
    if ! grep -q "Custom settings from dotfiles" ~/.bashrc 2>/dev/null; then
        echo "" >> ~/.bashrc
        echo "# Custom settings from dotfiles" >> ~/.bashrc
        cat "$HOME/dotfiles/.bashrc_custom" >> ~/.bashrc
        echo "✅ Custom bashrc settings added"
    else
        echo "ℹ️  Custom bashrc settings already present"
    fi
else
    echo "⚠️  .bashrc_custom not found, skipping"
fi

echo "✅ Dotfiles setup complete!"
echo "🎉 Your environment is ready!"
echo ""
echo "To apply changes, run: source ~/.bashrc"
EOF

# Make install.sh executable
chmod +x install.sh
```

---

### Step 4: Commit and Push Your Dotfiles

```pwsh
git add .
git commit -m "Initial dotfiles setup for Codespaces"
git push origin main
```

---

## Part 2: Configure GitHub Codespaces to Use Your Dotfiles

### Step 1: Enable Dotfiles in Your GitHub Settings

1. Go to GitHub → Click your profile picture → **Settings**
2. In the left sidebar, click **Codespaces**
3. Scroll to **Dotfiles** section
4. Check ✅ **"Automatically install dotfiles"**
5. Select your `dotfiles` repository from the dropdown
6. **Install command** (optional): `./install.sh`
7. Click **Save**

**What this does:**
- Every new Codespace will automatically clone your dotfiles repo
- The install script runs during Codespace creation
- Your environment is personalized automatically!

---

## Part 3: Test Your Dotfiles in a Codespace

### Step 1: Create a Test Repository

```pwsh
# Create a test repo (or use your existing GH900 repo)
cd ~/
mkdir codespace-test
cd codespace-test
git init
echo "# Testing Codespaces with Dotfiles" > README.md
git add .
git commit -m "Initial commit"

# Create repo on GitHub and push
gh repo create codespace-test --public --source=. --remote=origin --push
```

Or use your existing GH900 repository!

---

### Step 2: Launch a Codespace

**Method 1: From GitHub Web**

1. Go to your repository on GitHub
2. Click the **"Code"** button (green button)
3. Click **"Codespaces"** tab
4. Click **"Create codespace on main"**

**Method 2: From GitHub CLI**

```pwsh
gh codespace create --repo YOUR-USERNAME/codespace-test
```

**What happens:**
1. Codespace provisions
2. Your dotfiles repo is cloned
3. `install.sh` runs automatically
4. Your personalized environment is ready!

---

### Step 3: Verify Your Dotfiles Loaded

In your Codespace terminal, try:

```bash
# Test git aliases
git aliases

# Test custom aliases
gs  # Should run 'git status'
ll  # Should list files with details

# Check git config
git config user.name
git config user.email

# View your custom prompt (should show git branch)
# Your prompt should look different now!

# Test the welcome message
# Should have appeared when you opened the terminal
```

---

## Part 4: Advanced Dotfiles Examples

### Example 1: VS Code Settings

Create `.vscode/settings.json` in your dotfiles:

```json
{
    "editor.fontSize": 14,
    "editor.tabSize": 2,
    "editor.formatOnSave": true,
    "files.autoSave": "afterDelay",
    "workbench.colorTheme": "GitHub Dark Default",
    "terminal.integrated.fontSize": 13,
    "git.autofetch": true,
    "git.confirmSync": false
}
```

Update `install.sh` to copy it:

```bash
# In install.sh, add:
mkdir -p ~/.vscode-server/data/Machine
cp ~/dotfiles/.vscode/settings.json ~/.vscode-server/data/Machine/settings.json
```

---

### Example 2: Python Configuration

Create `.pypirc` for Python package publishing:

```ini
[distutils]
index-servers =
    pypi

[pypi]
username = __token__
```

---

### Example 3: Node.js Configuration

Create `.npmrc`:

```
init-author-name=Your Name
init-author-email=your.email@example.com
init-license=MIT
save-exact=true
```

---

### Example 4: Environment Variables

Create `.env_custom`:

```bash
# Development settings
export PYTHONPATH="$HOME/workspace:$PYTHONPATH"
export NODE_ENV="development"
export DEBUG=true

# Custom paths
export PATH="$HOME/.local/bin:$PATH"

# Preferred editor
export EDITOR="code --wait"
```

Add to `.bashrc_custom`:

```bash
if [ -f ~/.env_custom ]; then
    source ~/.env_custom
fi
```

---

## Part 5: Codespace-Specific Configuration

### Create `.devcontainer/devcontainer.json` in Your Project

This configures the Codespace itself (not in dotfiles repo, but in your project):

```json
{
  "name": "My Development Environment",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  
  "features": {
    "ghcr.io/devcontainers/features/node:1": {
      "version": "lts"
    },
    "ghcr.io/devcontainers/features/python:1": {
      "version": "3.11"
    },
    "ghcr.io/devcontainers/features/git:1": {}
  },
  
  "customizations": {
    "vscode": {
      "extensions": [
        "github.copilot",
        "ms-python.python",
        "dbaeumer.vscode-eslint",
        "esbenp.prettier-vscode"
      ]
    }
  },
  
  "postCreateCommand": "echo '🎉 Codespace is ready!'",
  
  "forwardPorts": [3000, 8000, 8080],
  
  "portsAttributes": {
    "3000": {
      "label": "Frontend",
      "onAutoForward": "notify"
    }
  }
}
```

---

## Part 6: Managing Multiple Dotfile Sets

### Strategy 1: Branches for Different Environments

```bash
# Create different branches
git checkout -b work
# Add work-specific configs
git commit -m "Work environment setup"

git checkout -b personal
# Add personal configs
git commit -m "Personal environment setup"
```

In GitHub Codespaces settings, choose which branch to use.

---

### Strategy 2: Conditional Loading

In `.bashrc_custom`:

```bash
# Load different configs based on repository
if [[ "$PWD" == *"work-project"* ]]; then
    source ~/.bash_aliases_work
else
    source ~/.bash_aliases_personal
fi
```

---

## Part 7: Useful Dotfiles Additions

### Git Hooks

Create `git-hooks/pre-commit`:

```bash
#!/bin/bash
# Run tests before committing
echo "Running pre-commit checks..."
npm test
```

---

### Custom Scripts

Create `scripts/update-repos.sh`:

```bash
#!/bin/bash
# Update all git repositories in workspace
for dir in ~/workspace/*/ ; do
    echo "Updating $(basename $dir)..."
    cd "$dir"
    git pull
done
```

Make executable:
```bash
chmod +x scripts/update-repos.sh
```

---

## Part 8: Troubleshooting

### Dotfiles Not Loading?

**Check if dotfiles were cloned:**
```bash
ls -la ~/dotfiles
```

**Check install script ran:**
```bash
cat ~/.bashrc | grep "Custom settings"
```

**Manually run install script:**
```bash
cd ~/dotfiles
bash install.sh
source ~/.bashrc
```

---

### Force Reload Dotfiles

```bash
# In an existing Codespace
cd ~/dotfiles
git pull
bash install.sh
source ~/.bashrc
```

---

### Common Issues

**Problem**: Changes not appearing
- **Solution**: Restart the terminal or run `source ~/.bashrc`

**Problem**: Install script has errors
- **Solution**: Check script syntax, ensure it's executable
  ```bash
  chmod +x ~/dotfiles/install.sh
  ```

**Problem**: Dotfiles repo not found
- **Solution**: Verify repository name is exactly `dotfiles` and settings are correct

---

## Best Practices

### ✅ Do's

- Keep dotfiles minimal and well-organized
- Comment your configurations
- Use version control for all changes
- Test changes locally before pushing
- Document custom commands/aliases
- Use relative paths when possible
- Keep sensitive data out (use environment variables)

### ❌ Don'ts

- Don't commit passwords or API keys
- Don't override system-critical configs without backups
- Don't make the install script too complex
- Don't include large binary files
- Don't hardcode absolute paths unnecessarily

---

## Demo Script for Teaching

### Quick Demo (5 minutes)

1. **Show your dotfiles repo** on GitHub
2. **Create a new Codespace** from any repo
3. **Show the welcome message** and custom prompt
4. **Demonstrate aliases**: `gs`, `ll`, `glog`
5. **Show git config**: `git config --list`

### Full Demo (15 minutes)

1. Create dotfiles repo from scratch
2. Add `.bash_aliases` with a few useful aliases
3. Create simple `install.sh`
4. Configure Codespaces settings
5. Launch a Codespace and watch it set up
6. Demonstrate the personalized environment
7. Show how to update dotfiles (push changes, reload)

---

## Example Dotfiles Repository Structure

```
dotfiles/
├── README.md
├── install.sh
├── .gitconfig
├── .bash_aliases
├── .bashrc_custom
├── .env_custom
├── .vscode/
│   └── settings.json
├── scripts/
│   ├── setup-python.sh
│   └── setup-node.sh
└── configs/
    ├── .prettierrc
    └── .eslintrc.json
```

---

## Resources

- [GitHub Codespaces Dotfiles Documentation](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-github-codespaces-for-your-account)
- [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles) - Collection of dotfile resources
- [Dotfiles Guide](https://dotfiles.github.io/) - Community-driven guide

---

## Summary

You now know how to:
- ✅ Create a dotfiles repository
- ✅ Configure Git, Bash, and shell aliases
- ✅ Write installation scripts
- ✅ Enable dotfiles in GitHub Codespaces
- ✅ Test and troubleshoot your setup
- ✅ Maintain a personalized development environment

**Next Steps:**
1. Create your own dotfiles repository
2. Start with basic configurations
3. Add more as you discover preferences
4. Share your dotfiles repo (many developers do this!)

---

Happy Coding in the Cloud! ☁️🚀
