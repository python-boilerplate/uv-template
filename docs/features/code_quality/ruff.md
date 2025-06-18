# Ruff

[Ruff](https://docs.astral.sh/ruff/) — An extremely fast Python linter and code formatter, written in Rust.

---

## What is it used for here?
!!! question "!"
    - **`linting` Python code to enforce coding standards and catch potential errors**
    - **`formatting` Python code to ensure consistent style**
    - **сhecking code quality before every commit and during CI pipelines**

---

## How to use it?

- **In this case, Makefile does exactly the same thing as commands run without it using uv. It is only used for abbreviated launch.**

!!! tip "!"

    === "Makefile"

        ```bash
        make lint # lint your code

        make format # format your code
        ```

    === "Manually (Without make and uv)"

        ```bash
        ruff check --config=pyproject.toml --fix ./src/
        ```

        ```bash
        ruff format --config=pyproject.toml ./src/
        ```

    === "Manually (With uv)"

        ```bash
        uv run ruff check --config=pyproject.toml --fix ./src/
        ```

        ```bash
        uv run ruff format --config=pyproject.toml ./src/
        ```

## How to use it with pre-commit?

To use Ruff with pre-commit, you need to add a configuration for it in your `.pre-commit-config.yaml` file.

!!! tip "!"

    === "Hook (by ruff)"

        ```yaml title=".pre-commit-config.yaml"
        - repo: https://github.com/astral-sh/ruff-pre-commit
          rev: v0.11.12
          hooks:
            # Run the linter.
            - id: ruff-check
              args: [ --config=pyproject.toml ]
              files: ^src/

            # Run the formatter.
            - id: ruff-format
              args: [ --config=pyproject.toml ]
              files: ^src/
        ```

    === "Hook (your own)"

        ```yaml title=".pre-commit-config.yaml"
        - repo: local
          hooks:
            # lint code
            - id: ruff
              name: Ruff
              description: Run Ruff for linting Python code
              entry: uv run ruff check --config=pyproject.toml ./src/
              types: [python]
              language: system
              always_run: true
              pass_filenames: false

            # format code
            - id: ruff
              name: Ruff
              description: Run Ruff for formatting Python code
              entry: uv run ruff format --config=pyproject.toml ./src/
              types: [python]
              language: system
              always_run: true
              pass_filenames: false
        ```

## Configuration
Main settings are in the pyproject.toml file.

---

You can find more information about linter and formatter configuration here: [Ruff Documentation](https://docs.astral.sh/ruff/)