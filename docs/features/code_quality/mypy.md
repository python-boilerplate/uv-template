# MyPy

Static type checker for Python, designed to ensure code correctness and catch type errors before runtime.

---

## What is it used for here?
!!! question "!"
    - **`type checking` Python code to catch type errors early**
    - **enforcing and verifying type annotations**
    - **checking code quality before every commit and during CI pipelines**

---

## How to use it?

- **In this case, the Makefile does the same as running the commands directly via uv. The Makefile is only needed to shorten commands.**

!!! tip "!"

    === "Makefile"

        ```bash
        make typecheck
        ```

    === "Manually (Without make and uv)"

        ```bash
        mypy --config-file=pyproject.toml ./src/
        ```

    === "Manually (With uv)"

        ```bash
        uv run mypy --config-file=pyproject.toml ./src/
        ```

## How to use it with pre-commit?

To use MyPy with pre-commit, you need to add the appropriate configuration to `.pre-commit-config.yaml`.

!!! tip "!"

    === "Hook (by mypy)"

        ```yaml title=".pre-commit-config.yaml"
        - repo: https://github.com/pre-commit/mirrors-mypy
          rev: v1.16.0
          hooks:
            - id: mypy
              args: [ --config-file=pyproject.toml ]
              files: ^src/
        ```

    === "Hook (your own)"

        ```yaml title=".pre-commit-config.yaml"
        - repo: local
          hooks:
            # check types
            - id: mypy
              name: Mypy
              description: Run Mypy for type checking types in Python code
              entry: uv run mypy --config-file=pyproject.toml ./src/
              types: [python]
              language: system
              always_run: true
              pass_filenames: false
        ```

## Configuration
The main settings are located in the `pyproject.toml` file.

---

For more details on configuration, see the [MyPy Documentation](https://mypy.readthedocs.io/en/stable/)