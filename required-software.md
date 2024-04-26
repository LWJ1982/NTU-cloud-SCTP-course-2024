
# Required Software for Cloud Insfrastructure Engineering Program

## Introduction

This document outlines the software required for the Cloud Insfrastructure Engineering Program. Please install this software before starting the course unless instructed otherwise.

### Complete Fundamentals Setup

- Install the latest version of **Windows or MacOS** that your computer supports.
- Obtain and install the required hardware, software, and accounts for Fundamentals.

### [Windows Only] Install Windows-Specific Software

#### Install and Setup Windows Subsystem for Linux (WSL)

WSL allows running the Linux operating system on Windows machines, which is beneficial as most programming uses Unix-based systems. Before installing WSL, update Windows to the latest version.

- [Install WSL here](https://learn.microsoft.com/en-us/windows/wsl/install)
- [Install the latest version of Ubuntu here](https://apps.microsoft.com/store/detail/ubuntu-22041-lts/9PN20MSR04DW?hl=en-sg&gl=sg)

Commands to run in Ubuntu in WSL:
```bash
sudo apt install build-essential  # Install standard libraries for Ubuntu
sudo apt-get install ca-certificates  # Get SSL verification certificates
```

#### Integrate VS Code with WSL

- Install the [VS Code Remote Development extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack).
- Click the Remote Development extension icon in the bottom left corner of VS Code.
- Select "Remote-WSL: New Window" from the popup menu.

### [Mac Only] Install Mac-Specific Software

#### Install Homebrew

Follow instructions at [https://brew.sh/](https://brew.sh/) to install Homebrew, a package manager for MacOS.

#### Install and Configure Git

##### Windows/MacOS

Open an Ubuntu terminal in VS Code and run the following commands separately:
```bash
sudo apt-get update
sudo apt-get install git
git --version  # Verify correct installation
```

##### Personal Access Tokens

Create a personal access token as per these [instructions]() and save it securely.

##### Configure Git Defaults

- Set the default Git branch:
  ```bash
  git config --global init.defaultBranch main
  ```
- Set the default Git code editor to VS Code:
  ```bash
  git config --global core.editor "code --wait"
  ```
- Set your GitHub credentials:
  ```bash
  git config --global user.name "<YOUR_GITHUB_USERNAME>"
  git config --global user.email "<YOUR_GITHUB_EMAIL>"
  ```

##### Verify Git Configuration

Type `git config -l` in the terminal to check if the configuration was successful.

#### Install Node.js

Commands to run in Ubuntu in VS Code:
```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
```

#### Install Code Formatters

- [Install Prettier extension for VS Code](#)
- Install ESLint:
  ```bash
  sudo npm i -g eslint
  ```
- [Install the ESLint VS Code extension](#)

#### Set VS Code Formatting Settings

Open the command prompt in VS Code (`Ctrl+Shift+P` on Windows, `Cmd+Shift+P` on Mac) and select `Preferences: Open Settings (JSON)`. Replace the contents with the following and restart VS Code:

```json
{
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.formatOnSave": true,
  "editor.formatOnPaste": true,
  "editor.tabSize": 2
}
```

### Setup Folder Structure for Cloud Insfrastructure Engineering Program

Create a folder called `CE` and within it, create folders `m1`, `m2`, and `m3`for each module.

### Sign Up for Accounts

- Codecademy
- LeetCode
- HackerRank