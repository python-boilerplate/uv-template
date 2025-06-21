# Pre-Commit

A framework for managing and maintaining multi-language pre-commit hooks.

---

## What is it used for here?
!!! question "!"
    - Automatically runs linters, formatters, and tests before each commit
    - Ensures code quality and formatting consistency on every commit
    - Prevents committing code that doesn't meet project standards

---

## How to use it?

!!! tip "!"
    === "Setup (runs automatically on make init)"

        ```bash
        make init
        # or manually:
        uv run pre-commit install --install-hooks
        ```

    === "Run all hooks manually"

        ```bash
        uv run pre-commit run --all-files
        ```

---

## How to add hooks

- Edit the [.pre-commit-config.yaml](https://github.com/python-boilerplate/uv-template/blob/main/.pre-commit-config.yaml) file and add the required hook. For example, to add Ruff:

    ```yaml title=".pre-commit-config.yaml"
    - repo: https://github.com/astral-sh/ruff-pre-commit
      rev: v0.11.12
      hooks:
        - id: ruff-check
          args: [ --config=pyproject.toml ]
          files: ^src/
    ```

- After editing, run:

    ```bash
    uv run pre-commit install
    ```

---

## Used hooks

!!! tip "!"
    - [ruff](./code_quality/ruff.md): linter and formatter
    - [mypy](./code_quality/mypy.md): type checker
    - [pytest](./code_quality/pytest.md): testing framework
    - [commitizen](./commitizen.md): commit message linter

---

## Configuration

- All pre-commit hook settings are in [.pre-commit-config.yaml](https://github.com/python-boilerplate/uv-template/blob/main/.pre-commit-config.yaml).

---

For more details on configuration, see the [pre-commit Documentation](https://pre-commit.com/).
