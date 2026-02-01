# Dotfiles

This repository contains my personal configuration files (dotfiles) for macOS and Linux, managed efficiently with [chezmoi](https://www.chezmoi.io/).

## 📦 Contents

| Category | Tool | Path |
|----------|------|------|
| **Editor** | Neovim (LazyVim) | `~/.config/nvim` |
| **Terminal** | Kitty | `~/.config/kitty` |
| **Shell** | Zsh + Atuin + Fastfetch | `~/.zshrc`, `~/.config/atuin`, `~/.config/fastfetch` |
| **Multiplexer** | Tmux / Byobu | `~/.config/tmux`, `~/.byobu` |
| **File Manager** | Yazi | `~/.config/yazi` |
| **PDF Viewer** | Zathura | `~/.config/zathura` |
| **Window Manager** (macOS) | AeroSpace | `~/.config/aerospace` |
| **Hotkeys** (macOS) | skhd | `~/.config/skhd` |

## 🚀 Usage on macOS with Chezmoi

### 1. Installation

First, install `chezmoi` via Homebrew:

```bash
brew install chezmoi
```

### 2. Initialization

Initialize chezmoi with this repository. Replace `username` with your GitHub username:

```bash
chezmoi init --apply https://github.com/username/dotfiles.git
```

If you have already cloned this repo manually to `~/.local/share/chezmoi`, just run:

```bash
chezmoi apply
```

### 3. Common Commands

*   **Apply changes** (update your home directory files from the source):
    ```bash
    chezmoi apply
    ```
*   **Edit a config file** (opens the source file in your `$EDITOR`):
    ```bash
    chezmoi edit ~/.config/aerospace/aerospace.toml
    ```
*   **Update source** (pull latest changes from the git remote):
    ```bash
    chezmoi update
    ```
*   **See differences** (check what will change before applying):
    ```bash
    chezmoi diff
    ```

## 🍎 macOS Specific Setup

Since this configuration uses **AeroSpace** and **skhd**, ensure you have them installed and running:

```bash
brew install --cask aerospace
brew install koekeishiya/formulae/skhd
skhd --start-service
```