# MkDocs

A fast and simple static site generator for project documentation, optimized for Markdown and the Material theme.

---

## What is it used for here?
!!! question "!"
    - Generates project documentation as a beautiful static site
    - Supports Markdown, code highlighting, and the Material theme
    - Allows you to preview documentation locally and easily publish it

---

## How to run MkDocs in this template

!!! tip "!"
    === "Start the documentation server locally"

        ```bash
        make serve
        # or manually:
        uv run mkdocs serve
        ```

    === "Build the static site"

        ```bash
        uv run mkdocs build
        ```

    === "Open the documentation in your browser"

        - After running `make serve`, go to your `localhost` address with port `8000` in the browser.

---

## Example workflow

!!! example "How to create your own documentation"
    1. **Create a new markdown file in the `docs/` folder**
        For example:
        ```bash
        touch docs/how_to_start.md
        ```

    2. **Add this file to the navigation in [mkdocs.yml](https://github.com/python-boilerplate/uv-template/blob/main/mkdocs.yml):**
        ```yaml title="mkdocs.yml"
        nav:
          - Home: index.md
          - How to Start: how_to_start.md
        ```

    3. **Start the local server to preview the result:**
        ```bash
        make serve
        # or
        uv run mkdocs serve
        ```

    4. **Open [http://localhost:8000](http://localhost:8000) in your browser and check that the page appears in the menu.**

    5. **Edit markdown files — changes are picked up automatically.**

---

## Configuration

- All MkDocs settings (theme, navigation, plugins, etc.) are in the [mkdocs.yml](https://github.com/python-boilerplate/uv-template/blob/main/mkdocs.yml) file.

---

For more details on configuration, see the [MkDocs Documentation](https://www.mkdocs.org/) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)