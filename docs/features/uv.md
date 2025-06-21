# uv

An ultra-fast Python project manager that simplifies working with dependencies and tools without unnecessary steps.

---

## What is it used for here?
!!! question "!"
    - **Installs all current project dependencies and features** (main and dev) after cloning (project initialization)
    - **Automatically creates an isolated environment** (similar to venv, but without manual steps)
    - **Allows running any Python tools** (e.g., pytest, ruff, mypy) without activating venv or extra configuration
    - **Ensures a consistent environment for local development, CI/CD, and devcontainer**

---

## How it works in this template

- After cloning the project, just run:
    ```bash
    make init
    ```
    This command:
    - Installs all dependencies via uv
    - Sets up pre-commit hooks

- To run Python tools (tests, linters, etc.), you needn't activate venv:
    ```bash
    uv run pytest
    uv run ruff check ./src/
    uv run mypy ./src/
    ```

- To add a new dependency:
    ```bash
    uv add <package-name>
    ```
    or for dev dependencies:
    ```bash
    uv add --group dev <package-name>
    ```

---

## How to update or change the Python version for the project

!!! tip "!"

    1. **Edit** the Python version in [pyproject.toml](https://github.com/python-boilerplate/uv-template/blob/main/pyproject.toml), for example:

        ```toml title="pyproject.toml"
        [project]
        requires-python = ">=3.11"
        ```

    2. **Remove the old environment (optional):**

        ```bash
        rm -r .venv
        ```

    3. **Change the Python version in your `.python-version` file:**

        ```bash
        uv python pin 3.11
        ```

        - You can specify any interpreter available on your system (`python3.12`, `python3.10`, etc.).
        - If the specified Python version is not installed, uv will automatically install it.
        - If you don't specify a version, uv uses the current Python version installed on your system.

    4. **Reinstall dependencies:**

        ```bash
        make init

        # or only dependencies without reinstalling hooks
        uv sync --link-mode=copy
        ```

    - The project now uses the desired Python version in its venv.

---


## Configuration

- All configuration for uv in this template is located in [pyproject.toml](https://github.com/python-boilerplate/uv-template/blob/main/pyproject.toml) (file is generated automatically by uv).

---

For more details on configuration, see the [uv Documentation](https://github.com/astral-sh/uv)