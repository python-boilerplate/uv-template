# Dev Containers

A dev container is a complete, reproducible development environment defined as code. It allows you to develop inside an isolated container using all required tools, dependencies, and settings, regardless of your host system.

---

## What is it used for here?
!!! question "!"
    - **Ensures consistent development environment** for every developer, every time.
    - **Works out of the box** in GitHub Codespaces, VS Code Remote Containers, and compatible tools.
    - **Automates installation of Python, Docker, uv, Commitizen, and other essential tools.**
    - **Runs `make init` automatically** after starting the container, so the project is ready to use immediately.

---

## Features

- Based on the official `mcr.microsoft.com/devcontainers/python:1-3.110-bookworm` image (Python 3.10).
- Installs and configures:
    - Docker (with Buildx and Compose v2)
    - [uv](https://github.com/astral-sh/uv) (Python dependency manager)
    - GitHub CLI
    - GitHub Actions runner
    - VS Code Python, Pylance, Ruff, and MyPy extensions
- Runs `make init` after container creation to set up dependencies and git hooks.
- All project commands and tools are available as if run locally.

---

## How to use it?

!!! example "!"
    You can use dev containers in various ways depending on your development setup

    === "VS Code:"

          - **Install** the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
          - **Open** the project folder in VS Code.
          - **Click** “Reopen in Container” when prompted, or open the Command Palette (`F1`) and run “Dev Containers: Reopen in Container”.

    === "GitHub Codespaces:"
          - Just click “Code > Codespaces > Create codespace on main” in your repository on GitHub.

    === "Other tools:"
          - Any IDE or workflow that supports [devcontainer.json](https://containers.dev/) will work.

---

## Configuration

All configuration for Devcontainers in this template is located in [devcontainer.json](https://github.com/python-boilerplate/uv-template/blob/main/.devcontainer/devcontainer.json).

---

## Example workflow

!!! example "!"
    1. **Clone the repository.**
    2. **Open it in VS Code and reopen in container (or launch a Codespace).**
    3. **Wait for the container to build and initialize (tools and dependencies are installed automatically).**
    4. **Start developing!**
       Use `make` commands, run tests, or launch the app as you would locally.

---

## Notes

!!! note "!"
    - All development tools, dependencies, and environment variables are isolated from your host system.
    - Any changes to `.devcontainer/devcontainer.json` will trigger a rebuild on the next launch.
    - The initial setup (`make init`) is fully automated for a zero-config first run.

---

For more details on configuration, see the [devcontainer.json specification](https://containers.dev/implementors/json_reference/) and [VS Code Dev Containers documentation](https://code.visualstudio.com/docs/devcontainers/containers).