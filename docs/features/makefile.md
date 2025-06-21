# Makefile

A simple way to automate everyday project tasks with a single command. It allows you to run typical scripts (`init`, `test`, `lint`, `run`, etc.) without remembering long commands, and standardizes workflows for all developers.

---

## What is it used for here?
!!! question "!"
    - Makes work scripts short and convenient (`make test` instead of `uv run pytest`)
    - Unifies command execution for local work, CI/CD, and devcontainer
    - Allows you to easily add your own automation scripts

---

## How to run Makefile commands

- Your should be in the project root directory (where the `Makefile` is located).

!!! tip "!"
    - Command format:
      ```bash
      make <command_name>
      ```
      For example:
      ```bash
      make init
      make lint
      make run
      ```

    - To see all available commands (with short descriptions), use:
      ```bash
      make help
      ```
      Or just `make` — by default, it runs help.

---

## How to add your own command or section

!!! example "!"

    === "New Command"
        1. Open the [Makefile](https://github.com/python-boilerplate/uv-template/blob/main/Makefile).
        2. Add a new target in the format:
            ```makefile
            my-command:  ## Command description
                <shell-command>
            ```

            - The `##` prefix indicates a description of command that will appear in the help output.

            For example:
                ```makefile
                echo-hello:  ## Print Hello World
                    echo "Hello World"
                ```

        3. Now you can run:
            ```bash
            make echo-hello
            ```
        4. Now you can see your command in the help:
            ```bash
            make help
            ```

    === "New Section"
        1. Open the [Makefile](https://github.com/python-boilerplate/uv-template/blob/main/Makefile).
        2. Add a new section in the format:
            ```makefile
            ##@ Name of section
            setup:
                <shell-command>
            ```

            - The `##@` prefix indicates a new section in the help output.
            - All commands that follow this line will be included in this section.

            For example:
                ```makefile
                ##@ My section
                my-command:
                    echo "This is my new section"
                ```

        3. Now you can run:
            ```bash
            make my-command
            ```

        4. Now you can see your section in the help:
            ```bash
            make help
            ```
---

## How does the `help` command work?

- In this template, the `make help` command automatically parses the Makefile, looks for targets with comments, and displays a short help message.
- Therefore, to have your command appear in help, always add a comment right after the target name and put it to correct section:
    ```makefile
    ##@ Local development
    lint: ## Run the linter
        $(ur) ruff check --config=pyproject.toml --fix ./src/
    ```

---

## Useful

- All main template commands are described in [usage/commands.md](../usage/commands.md).
- Makefile is OS-independent (works on Linux/macOS, on Windows via WSL or Git Bash).
- You can combine commands, for example:
    ```bash
    make lint format test
    ```

---

For more details on configuration, see the [GNU Make documentation](https://www.gnu.org/software/make/manual/make.html)