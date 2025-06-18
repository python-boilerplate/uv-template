# Vermin

A tool for determining the minimum Python version required to run your code, based on the syntax and standard libraries used.

---

## What is it used for here?
!!! question "!"
    - **analyzing the `minimal required Python version` for running your code**

---

## Features

- Vermin analyzes only your code's syntax and use of the standard library.

!!! warning "Important"
    - If you use external libraries that require newer Python versions, Vermin will not detect this. It does not check dependencies from requirements.txt or pyproject.toml.
    - In this template, Vermin is used exclusively in CI via GitHub Actions to ensure code backward compatibility.

---

## How to use it?

- There is no need to run Vermin manually or set it up locally — it is integrated into the CI workflow and runs automatically in GitHub Actions.

---

## Example run in GitHub Actions

!!! example "!"
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