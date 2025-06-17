# Ruff

[Ruff](https://docs.astral.sh/ruff/) — An extremely fast Python linter and code formatter, written in Rust.

---

## What is it used for here?
!!! question "!"
    - **`linting` Python code to enforce coding standards and catch potential errors**
    - **`formatting` Python code to ensure consistent style (while you are writing code)**
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

## Configuration
Main settings are in the pyproject.toml file.

---

You can find more information about linter and formatter configuration here: [Ruff Documentation](https://docs.astral.sh/ruff/)