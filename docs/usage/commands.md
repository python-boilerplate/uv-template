# Makefile Commands

This template maximally automates working with the project using a `Makefile`. It allows you to perform all main actions with a single command, without remembering long utility options.

!!! info "!"
    **All commands are run as `make <command>` (for example, `make test`).**

---

## Quick List

!!! tip "!"
    ```bash title="Makefile"
    make init         # Initialize the project (install dependencies, set up pre-commit)
    make run          # Run the application locally (without Docker)
    make test         # Run tests
    make lint         # Lint code (Ruff, autofix)
    make format       # Format code (Ruff)
    make typecheck    # Static type checking (MyPy)
    make clean        # Clean caches (`__pycache__`, .mypy_cache, .ruff_cache, .pytest_cache)
    make serve        # Start local documentation server (MkDocs)
    ```

---

## Local Development

- **`make init`**
    Installs dependencies via [uv](https://github.com/astral-sh/uv) and sets up pre-commit hooks.
- **`make run`**
    Runs the application (`__main__.py`) in the current environment.
- **`make test`**
    Runs all automated tests using [pytest].
- **`make lint`**
    Checks code style and applies autofix using [Ruff].
- **`make format`**
    Formats code according to Ruff settings.
- **`make typecheck`**
    Checks types using [MyPy].
- **`make clean`**
    Removes all tool caches.

---

## Docker:

### Development

- **`make dev-build`**
    Builds the dev Docker image based on `dev.Dockerfile`.
- **`make dev-up`**
    Runs the dev container in the background.
- **`make dev-stop`**
    Stops the dev container without removing it.
- **`make dev-down`**
    Stops and removes the dev container.
- **`make dev-logs`**
    Shows logs from the dev container.
- **`make dev-exec`**
    Opens a bash shell in the running dev container.
- **`make dev-bash`**
    Starts a new bash shell in the dev container (temporary, with .env.development).


### Production

- **`make prod-build`**
    Builds the production Docker image based on `prod.Dockerfile`.
- **`make prod-run`**
    Runs the production container in the background.
- **`make prod-exec`**
    Opens a bash shell in the running prod container.
- **`make prod-bash`**
    Starts a new bash shell in the prod container (temporary, with .env.production and with `--rm` flag).
- **`make prod-logs`**
    Shows logs from the prod container.

---

## Git/Release

- **`make commit`**
    Creates a commit using [Commitizen](https://commitizen-tools.github.io/commitizen/) (launches a wizard for conventional commits).
- **`make bump`**
    Bumps the project version and automatically updates `CHANGELOG.md` (Commitizen).

---

## Documentation

- **`make serve`**
    Starts a local documentation server ([MkDocs](https://www.mkdocs.org/)).

---

## Help

- **`make help`**
    Outputs a list of all available commands and their short descriptions.

---

## Common Makefile Shortcuts
!!! tip "!"
    - `d` — shortcut for `docker`
    - `dc` — shortcut for `docker compose`
    - `ur` — shortcut for `uv run`

---

## Notes

!!! note "!"
    - **All Makefile commands can be used in CI/CD, locally, or in a devcontainer.**
    - **No other scripts or CLIs are needed: all main scenarios are automated via Makefile.**
    - **All container parameters (such as environment variables) are defined in the corresponding `.env.*` files.**

---

For more details about used features, see the [Features section](../../features) in the documentation