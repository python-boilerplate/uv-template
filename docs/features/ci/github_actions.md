# GitHub Actions

A powerful CI/CD platform built into GitHub for automating workflows: testing, linting, type-checking, and more.

---

## What is it used for here?
!!! question "!"
    - **Automatically runs linters, tests, and checks code quality for every push and pull request**
    - **Ensures your code works on multiple Python versions**
    - **Checks code compatibility with the minimum Python version using Vermin**
    - **Runs all key quality tools: Ruff, MyPy, Pytest, and more**

---

## How does it work in this template?

- **Workflow files are located in [`.github/workflows/`](https://github.com/python-boilerplate/uv-template/tree/main/.github/workflows)**.
- Actions are triggered automatically on push or pull request to key branches.
- Each workflow installs only used dependencies using default `pip`.
- Main scenarios covered:
    - **Linting:** Checks code style with [Ruff](../code_quality/ruff.md)
    - **Type Checking:** Validates type annotations using [MyPy](../code_quality/mypy.md)
    - **Testing:** Runs all tests with [Pytest](../code_quality/pytest.md)
    - **Compatibility:** Checks minimal Python version compatibility with [Vermin](../code_quality/vermin.md)
    - **Multi-Python:** Runs tests on several Python versions (e.g., 3.10, 3.11, 3.12, 3.13)

---

## Example workflows

!!! example "Common workflow: Lint, Typecheck, Test"
    ```yaml title=".github/workflows/code-quality.yml"
    name: Lint, Typecheck, Test

    on:
      push:
        branches: [main]
      pull_request:
        branches: [main]

    jobs:
      build:
        runs-on: ubuntu-latest
        strategy:
          matrix:
            python-version: ["3.10", "3.11", "3.12"]
        steps:
          - uses: actions/checkout@v4
          - uses: actions/setup-python@v4
            with:
              python-version: ${{ matrix.python-version }}
          - name: Install dependencies
            run: uv pip install -r requirements-dev.txt
          - name: Lint
            run: uv run ruff check ./src/
          - name: Typecheck
            run: uv run mypy ./src/
          - name: Test
            run: uv run pytest -v
    ```

!!! example "Compatibility check: Vermin"
    See [Vermin section](../code_quality/vermin.md) for details.

---

## How to add or edit workflows

- **All workflow YAML files are in `.github/workflows/`**
- To add a new workflow, just copy an existing `.yml` file and edit as needed.

---

## Configuration and secrets

- No sensitive secrets are used by default in this template.
- For advanced scenarios (e.g., publishing, deploying), add secrets in GitHub repo settings and reference via `${{ secrets.YOUR_SECRET }}`.

---

For more details, see the [GitHub Actions Documentation](https://docs.github.com/en/actions).
