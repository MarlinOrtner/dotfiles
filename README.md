# Dotfiles

This repository contains my personal configuration files (dotfiles) for **macOS** and **Linux**, managed efficiently with [chezmoi](https://www.chezmoi.io/).

## 📦 Contents

| Domain | Tool | Path |
|----------|------|------|
| **Editor** | Neovim (LazyVim) | `~/.config/nvim` |
| **Terminal** | Kitty | `~/.config/kitty` |
| **Shell** | Zsh + Atuin + Fastfetch | `~/.zshrc`, `~/.config/atuin`, `~/.config/fastfetch` |
| **Multiplexer** | Tmux / Byobu | `~/.config/tmux`, `~/.byobu` |
| **File Manager** | Yazi | `~/.config/yazi` |
| **PDF Viewer** | Zathura | `~/.config/zathura` |
| **Window Manager** (macOS) | AeroSpace | `~/.config/aerospace` |
| **Hotkeys** (macOS) | skhd | `~/.config/skhd` |

## 🚀 Getting Started

### 1. Install Chezmoi

**macOS** (via Homebrew):
```bash
brew install chezmoi
```

**Linux** (via Snap or script):
```bash
# Snap
sudo snap install chezmoi --classic

# Or one-line binary install
sh -c "$(curl -fsLS get.chezmoi.io)"
```

### 2. Initialize & Apply

Initialize chezmoi with this repository. Replace `username` with your GitHub username:

```bash
chezmoi init --apply https://github.com/username/dotfiles.git
```

If you have already cloned this repo manually to `~/.local/share/chezmoi`, just run:

```bash
chezmoi apply
```

## 🛠️ Workflow & Commands

*   **Apply changes** (update your home directory files from the source):
    ```bash
    chezmoi apply
    ```
*   **Edit a config file** (opens the source file in your `$EDITOR`):
    ```bash
    chezmoi edit ~/.config/nvim/init.lua
    ```
*   **Update source** (pull latest changes from the git remote):
    ```bash
    chezmoi update
    ```
*   **See differences** (check what will change before applying):
    ```bash
    chezmoi diff
    ```

## 🧩 Conventions

*   **Templating:** The project uses `chezmoi` templates (e.g., `dot_zshrc.tmpl`) to handle OS-specific logic.
*   **Naming:**
    *   `dot_filename` → `~/.filename`
    *   `executable_filename` → `~/.filename` (with +x permission)
    *   `private_filename` → `~/.filename` (private, usually ignored)

## 🍎 macOS Specific Setup

Since this configuration uses **AeroSpace** and **skhd**, ensure you have them installed and running:

```bash
brew install --cask aerospace
brew install koekeishiya/formulae/skhd
skhd --start-service
```
