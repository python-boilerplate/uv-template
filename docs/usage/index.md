# Quickstart

This section describes how to get started with this project: how to clone or create your own copy, and how to launch the app in different ways (locally, with Docker, or in Codespaces).

---

## How to Get the Project

!!! tip "!"
    === "Option A: Use as a Template"

        **If you want to start your own project based on this boilerplate, use GitHub’s “Use this template” button:**

        !!! example "workflow"
            1. Go to the [repository page](https://github.com/python-boilerplate/uv-template).
            2. Click **Use this template** (top right).
            3. Create a new repository under your GitHub account.
            4. Clone your new repository:
                ```bash
                git clone https://github.com/<your-username>/<your-new-repo>.git
                cd <your-new-repo>
                ```

    === "Option B: Clone Directly"

        **If you want to contribute here or just try the boilerplate as-is:**

        !!! example "workflow"
            1. Go to the [repository page](https://github.com/python-boilerplate/uv-template).
            2. Click **Code > Download ZIP** (or clone the repo).
            3. Extract the ZIP file (if used).
            4. Navigate into the project directory:
                ```bash
                cd uv-template
                ```

---

## How to Run the Project

!!! tip "!"
    === "Option 1: GitHub Codespaces / Dev Containers (Zero Setup)"

        !!! example "workflow"
            1. On GitHub, click **Code > Codespaces > Create codespace on main**.
            2. _Or_, open the project in VS Code with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
            3. Choose “Reopen in Container” when prompted.
            4. Wait while all dependencies and tools are installed automatically.
            5. You can now use all `make` commands, run the app, tests, etc.

    === "Option 2: Local Development (No Docker)"

        **Requirements:** Python 3.10+, [uv](https://github.com/astral-sh/uv) (or pip if you know what you’re doing).

        !!! example "workflow"
            1. Install [uv](https://github.com/astral-sh/uv) (recommended):
                ```bash
                curl -LsSf https://astral.sh/uv/install.sh | sh
                ```
            2. Install dependencies & set up pre-commit hooks:
                ```bash
                make init
                ```
            3. Run the app:
                ```bash
                make run
                ```
            4. Run tests, linter, formatter as needed:
                ```bash
                make test
                make lint
                make format
                ```

    === "Option 3: Local Development with Docker (Dev Environment)"

        **Best for:** Consistent dev environment, works anywhere Docker runs.

        !!! example "workflow"
            1. Build the development Docker image:
                ```bash
                make dev-build
                ```
            2. Start the dev container (in background):
                ```bash
                make dev-up
                ```
            3. Enter a shell in the container (if needed):
                ```bash
                make dev-exec
                ```
            4. View logs, stop, or remove the container as needed:
                ```bash
                make dev-logs
                make dev-stop
                make dev-down
                ```
            !!! info "Dev Docker specifics"
                - Uses `dev.Dockerfile` and `dev.dockerignore`
                    - Before building it runs `cp dev.dockerignore .dockerignore` to specify files to ignore
                - Loads environment from `.env.development`
                - Supports hot reload and development tools

    === "Option 4: Production Docker Image"

        **Best for:** Testing production-like runs or deployment.

        !!! example "workflow"
            1. Build the production image:
                ```bash
                make prod-build
                ```
            2. Run the production container:
                ```bash
                make prod-run
                ```
            3. Enter a shell in the container (if needed):
                ```bash
                make prod-exec
                ```
            4. Run container with `bash` or view logs:
                ```bash
                make prod-bash # temporary, with .env.production and with --rm flag
                make prod-logs
                ```

            !!! info "Prod Docker specifics"
                - Uses `prod.Dockerfile` and `prod.dockerignore`
                    - Before building it runs `cp prod.dockerignore .dockerignore` to specify files to ignore
                - Loads environment from `.env.production`
                - Optimized for minimal size and performance
---

## Useful Tips

- All common tasks (init, test, lint, format, docs, etc.) are available as simple `make` commands.
- See [docs/usage/commands.md](./commands.md) for the full list.
- Environments and secrets are configured via `.env.*` files (see `.env.example`).
- The project is ready for CI/CD with GitHub Actions and GitLab CI out of the box.

---

## Troubleshooting

- If you have permission errors with git hooks, run:
  ```bash
  chmod +x .git/hooks/*
  ```
- For Docker issues, ensure Docker is running and you have permissions (try `sudo` if needed).
- For Codespaces/Dev Containers, see the [Dev Containers docs](../features/devcontainers.md).

---

## More Info

- See [Features](../features/index.md) for detailed explanations of tools and setup.
- See [Project Structure](../reference/project_structure.md) for a file/folder overview.

---