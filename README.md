# 🚀 Python Boilerplate

<p align="center">
    <img src="https://img.shields.io/badge/python-3.11-blue" alt="Python"/>
    <img src="https://img.shields.io/badge/license-MIT-green" alt="License"/>
    <img src="https://img.shields.io/github/v/tag/monok8i/python-boilerplate" alt="Version"/>
</p>

---

A template for quickly starting new projects in Python. This repository provides a modern, pre-configured structure for Python applications, including best practices for development, testing, and deployment. It is designed to save time and help you start building right away.

## Features

- **[uv](https://github.com/astral-sh/uv)** — project, package, and tool manager. Provides fast dependency installation, environment isolation, and script execution.
- **[docker](https://github.com/docker)** — containerization for easy deployment and consistent application execution across environments.
- **[pre-commit hooks](https://github.com/pre-commit/pre-commit)** — automatic code quality checks before each commit, configured via `.pre-commit-config.yaml`.
- **[commitizen](https://github.com/commitizen-tools/commitizen/)** — automates semantic versioning and changelog generation based on standardized commit messages.
- **[ruff](https://github.com/astral-sh/ruff)** — Python linter and formatter to ensure code clarity and consistency.
- **[mypy](https://github.com/python/mypy)** — static type checker for increasing code reliability.
- **[make](https://www.gnu.org/software/make/manual/make.html)** — simplifies running scripts and automating tasks via commands in the `scripts/` directory.
- **[mkdocs](https://www.mkdocs.org/)** — generates documentation from Markdown files in the `docs/` directory for convenient web-based viewing.

## Getting Started

### Prerequisites

- uv
- Python (version specified in `.python-version`)
- Docker (optional, for containerization)

### Installation

1. **Clone this repository:**
   ```sh
   git clone https://github.com/monok8i/python-boilerplate.git
   cd python-boilerplate
   ```

2. **Set up a virtual environment:**
   ```sh
   python -m venv .venv
   source .venv/bin/activate
   ```

3. **Install dependencies:**
   ```sh
   pip install -r requirements.txt  # or use `pip install .` if using pyproject.toml
   ```

4. **Set up pre-commit hooks:**
   ```sh
   pre-commit install
   ```

5. **Configure environment variables:**
   - Copy `example.env` to `.env` and adjust as needed.

### Usage

- Place your application code in the `src/` directory.
- Add scripts for automation to the `scripts/` directory.
- Update `pyproject.toml` with your project's metadata and dependencies.

To run the project:
```sh
python -m src
```
or use the entry point in `__main__.py` if configured.

### Docker Support

To build and run the project using Docker:
```sh
docker-compose up --build
```

### Documentation

- Edit and view your documentation in the `docs/` directory.
- Build site using MkDocs:
  ```sh
  mkdocs serve
  ```

## Project Structure

```
.
├── src/                  # Main source code
├── scripts/              # Helper scripts
├── docs/                 # Project documentation
├── .pre-commit-config.yaml
├── pyproject.toml
├── Dockerfile
├── docker-compose.yml
├── example.env
├── mkdocs.yml
├── CHANGELOG.md
├── LICENSE
└── README.md
```

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the terms of the license found in the `LICENSE` file.
