# Vermin

A tool for determining the minimum Python version required to run your code, based on the syntax and standard libraries used.

---

## What is it used for here?
!!! question "!"
    - **analyzing the `minimal required Python version` for running your code**

---

## Important

- Vermin analyzes only your code's syntax and use of the standard library.

!!! warning "!"
    - If you use external libraries that require newer Python versions, Vermin will not detect this. It does not check dependencies from requirements.txt or pyproject.toml.
    - In this template, Vermin is used exclusively in CI via GitHub Actions to ensure code backward compatibility.

---

## How to use it?

- There is no need to run Vermin manually or set it up locally — it is integrated into the CI workflow and runs automatically in GitHub Actions.
- But of course, you can run it locally directly in your terminal or using pre-commit hook.


## Examples

!!! example "!"
    === "Locally (terminal):"

        ```bash
        uv run vermin --eval-annotations --backport typing --no-parse-comments .
        ```

        - `--eval-annotations` - evaluates type annotations to determine the minimum Python version.
        - `--backport typing` - backports the `typing` module to older Python versions.
        - `--no-parse-comments` - ignores comments in the code, focusing only on actual code syntax.
        - `.` - specifies the current directory as the target for analysis.

        - You can also specify a specific file or directory instead of `.` to analyze only that part of your codebase.

    === "Pre-commit hook:"
        ```yaml title=".pre-commit-config.yaml"
        - repo: local
          hooks:
            # Run Vermin.
            - id: vermin
              name: vermin
              entry: uv run vermin .
              language: system
              types: [python]
              pass_filenames: false
              args: [ --eval-annotations, --backport typing, --no-parse-comments ]
        ```

    === "Github Actions:"
        ```yaml title=".github/workflows/compatibility.yml"
        jobs:
          compatibility:
            runs-on: ubuntu-latest
            steps:
              - uses: actions/checkout@v4
              - uses: actions/setup-python@v4
                with:
                  python-version: "3.13"
              - name: Install dependencies
                run: |
                  pip install --upgrade pip
                  pip install vermin
              - name: Check minimal Python version
                run: vermin --eval-annotations --backport typing --no-parse-comments .
        ```

---

## Configuration

Vermin does not have its own configuration file — all parameters are set via the command line.

---

For more details on configuration, see the [Vermin Documentation](https://github.com/netromdk/vermin)