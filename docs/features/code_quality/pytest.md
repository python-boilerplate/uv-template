# Pytest

A powerful framework for testing Python code, supporting both synchronous and asynchronous tests.

---

## What is it used for here?
!!! question "!"
    - **`unit testing` and `integration testing` of Python code**
    - **testing both synchronous and asynchronous functions**
    - **automated quality checks before every commit and in CI pipelines**

---

## Important

!!! warning "!"
    - For testing asynchronous functions, the [pytest-asyncio](https://pytest-asyncio.readthedocs.io/en/latest/) extension is added, which makes it easy to write and run async tests alongside regular ones.

---

## How to use it?

- **In this case, the Makefile does the same as running the commands directly via uv. The Makefile is only needed to shorten commands.**

!!! tip "!"

    === "Makefile"

        ```bash
        make test
        ```

    === "Manually (Without make and uv)"

        ```bash
        pytest -v
        ```

    === "Manually (With uv)"

        ```bash
        uv run pytest -v
        ```

## How to use it with pre-commit?

Only a local hook is used for integration with pre-commit.
!!! question "Why?"
    Pytest does not officially provide a pre-commit hook repository, and running tests often requires custom parameters or environments (for example, via uv or with specific options). A local hook gives maximum flexibility and control.

!!! tip "!"

    === "Local hook (recommended)"

        ```yaml title=".pre-commit-config.yaml"
        - repo: local
          hooks:
            # Run pytest.
            - id: pytest
              name: pytest
              entry: uv run pytest
              language: system
              types: [python]
              pass_filenames: false
              args: [ -v ]
        ```
---

## Configuration

All configuration for Pytest (such as plugins) in this template is located in [pyproject.toml](https://github.com/python-boilerplate/uv-template/blob/main/pyproject.toml) under the `[tool.pytest.ini_options]` section.

---

For more details on configuration, see the [Pytest Documentation](https://docs.pytest.org/en/stable/)

About async tests: [pytest-asyncio documentation](https://pytest-asyncio.readthedocs.io/en/stable/)