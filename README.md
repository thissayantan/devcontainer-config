# Web Development Container Development Environment

This development environment provides a fully configured workspace for web development projects.

## Screenshots

![Screenshot of the container running](/screenshots/prompt.gif)

## Getting Started

1. Install [VS Code](https://code.visualstudio.com/).
2. Install [Docker](https://www.docker.com/products/docker-desktop).
3. Install the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension in VS Code.
4. Clone this repository to your local machine.
5. Open the repository folder in VS Code.
6. When prompted, click on "Reopen in Container". This will build the container and set up the environment as defined in the `devcontainer.json` file. If not prompted, you can open the command palette (`Ctrl+Shift+P` or `Cmd+Shift+P` on macOS), and type `Reopen in Container`.

## Features

### Container Configuration

The configuration for this dev container is found in the `devcontainer.json` file. This configuration includes:

- Base image: `mcr.microsoft.com/devcontainers/base:bookworm`.
- Node.js installed via a feature from the `ghcr.io/devcontainers/features/node:1` repository.
- Common utilities and zsh shell configuration via features from the `ghcr.io/devcontainers/features/common-utils:2` and `ghcr.io/devcontainers-contrib/features/zsh-plugins:0` repositories.
- Local directory mount from host to container at `/home/sayantan/.vscode-server-insiders`.
- Post creation script setup which installs various dependencies and configures the shell (see `post-create.sh` script below).

### VS Code Extensions and Settings

A set of VS Code extensions are installed in the container by default. These extensions include:

- ES7 React/Redux/GraphQL/React-Native snippets
- Material Theme and Material Icon Theme
- Cold Code
- Prettier - Code Formatter
- GitHub Actions and GitHub Copilot
- Black (Python code formatter)
- Python
- Sort JSON
- Code Spell Checker

Additional VS Code settings are also applied to provide a consistent editor configuration, such as:

- Font family, size, and other editor preferences.
- Emmet, Git, and terminal configurations.
- Language-specific settings for JavaScript, TypeScript, HTML, CSS, JSON, and Python.
- Theme and color customizations.

For a complete list of extensions and settings, refer to the `devcontainer.json` file.

### Post Creation Script

The `post-create.sh` script runs after the container is built. This script:

- Updates the system and installs prerequisites.
- Installs pyenv and the latest version of Python.
- Installs and configures Oh-My-Posh with a custom theme.

## Usage

Once the container is built and running, you can start developing your web projects right away. The workspace is fully configured with a robust set of tools and utilities, making it easy to jump into coding.

The terminal in VS Code will open inside the container where you have access to all the tools and utilities installed in the container. You can also open a new terminal at any time using the `Ctrl+` ` (backtick) or `Cmd+` ` (backtick) on macOS.

Your code files are also available within the container at the mounted directory, so you can edit files in VS Code on your local machine and run your code inside the container.

### Accessing Services

If your development environment requires access to certain ports (e.g., for a web server), you can add the `forwardPorts` attribute to the `devcontainer.json` file to specify a list of ports to forward from the container to your local machine.

```json
"forwardPorts": [3000, 5000]
```

Now, you can access the web server running inside the container at `http://localhost:3000` and `http://localhost:5000` on your local machine.

## Customizing the Environment

The `devcontainer.json` and `post-create.sh` files provide a good starting point for customizing your development environment. You can modify these files to change the base image, install additional tools and utilities, configure the shell, and more.

You can also add new scripts, configuration files, and other assets to the `.devcontainer` directory to further customize the environment.

## Troubleshooting

If you encounter any issues or have any questions about this dev container, you can check the [documentation](https://aka.ms/devcontainer.json) or [GitHub repository](https://github.com/devcontainers/templates/tree/main/src/debian) for more information.