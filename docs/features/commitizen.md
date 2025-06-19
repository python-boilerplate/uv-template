# Commitizen

A tool for creating standardized commit messages and automated versioning in your project.

---

## What is it used for here?
!!! question "!"
    - **standardizing commit messages** using the Conventional Commits specification
    - **automatically bumping project version** and generating/updating `CHANGELOG.md`
    - **integrating with pre-commit hooks** to ensure commit messages follow the defined style
---

## Features

- **Interactive CLI** for creating conventional commit messages via a wizard.
- **Automatic version bump** based on commit history (`major`, `minor`, `patch`).
- **Generates and updates `CHANGELOG.md`** automatically.

---

## How to use it?

- **In this case, the Makefile does the same as running the commands directly via uv. The Makefile is only needed to shorten commands.**

!!! tip "!"

    === "Makefile"

        ```bash
        make commit   # Interactive commit message creation (wizard)
        make bump     # Bump version and update CHANGELOG.md
        ```

    === "Manually (Without make and uv)"

        ```bash
        cz commit # or cz c
        cz bump
        ```

    === "Manually (With uv)"

        ```bash
        uv run cz commit # or uv run cz c
        uv run cz bump
        ```

---

## How to use it with pre-commit?

To use Commitizen with pre-commit, you need to add a configuration for it in your `.pre-commit-config.yaml` file.

!!! example "!"

    === "Hook (by commitizen)"

        ```yaml title=".pre-commit-config.yaml"
        - repo: https://github.com/commitizen-tools/commitizen
          rev: master
          hooks:
            - id: commitizen
            - id: commitizen-branch
            stages: [commit-msg, pre-push]
        ```

    === "Hook (your own)"

        - To check how to create your own hook, see the [Commitizen auto-check](https://commitizen-tools.github.io/commitizen/tutorials/auto_check/) tutorial.

---

## Configuration

All configuration for Commitizen in this template is located in [pyproject.toml](https://github.com/python-boilerplate/uv-template/blob/main/pyproject.toml) under the `[tool.commitizen]` section.

---

## Example workflow

### Without pre-commit

- **In the sense that the hook will run, but your message will be ignored because it matches the structure**

!!! example "!"
    1. **Create a commit** using `make commit` (or `cz commit`). The interactive CLI will help you compose a valid commit message.
    2. **Bump version and generate changelog** using `make bump` (or `cz bump`). This updates the version in `pyproject.toml` and regenerates `CHANGELOG.md` based on your commit history.
    3. **Push changes:** Push your code and the updated changelog/version to your repository.

### With pre-commit

- **The pre-commit hook will check the message format.**

!!! example "!"
    1. **Create a commit** using `git commit -m "feat: add new feature"`.
    2. **Bump version and generate changelog** using `make bump` (or `cz bump`). This updates the version in `pyproject.toml` and regenerates `CHANGELOG.md` based on your commit history.
    3. **Push changes:** Push your code and the updated changelog/version to your repository.

---

For more details, see the [Commitizen Documentation](https://commitizen-tools.github.io/commitizen/)