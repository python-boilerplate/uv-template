<h1 align="center"> Python Boilerplate </h1>

A comprehensive template for quickly starting new Python projects with modern development tools and best practices.

![Python Boilerplate](https://img.shields.io/badge/python-3.10+-blue.svg)
![uv](https://img.shields.io/badge/uv-0.7.13-purple.svg)
![Docker](https://img.shields.io/badge/docker-enabled-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
[![GitHub Actions Status](https://github.com/monok8i/python-boilerplate/actions/workflows/code-quality.yml/badge.svg)](https://github.com/monok8i/python-boilerplate/actions/workflows/code-quality.yml)
[![GitHub Actions Status](https://github.com/monok8i/python-boilerplate/actions/workflows/codeql.yml/badge.svg)](https://github.com/monok8i/python-boilerplate/actions/workflows/codeql.yml)


## 🚀 Features

- **Python 3.10+**
- **[uv](https://docs.astral.sh/uv/)** — Ultra-fast Python package installer and dependency resolver
- **Docker Support** — Multi-stage Dockerfiles for both local development and clean production containers
- **GitHub Actions CI/CD** — Automated pipelines for code quality checks, testing, security scanning, and Python compatibility validation
- **Dev Containers** — Pre-configured development environment for codespaces or remote development
- **Code Quality Tools** — Integrated linting with `Ruff`, static type checking with `MyPy`, comprehensive testing with `Pytest` and checking minimal Python version to run your code (without dependencies) with `Vermin`
- **Pre-commit Hooks** — Automated code quality enforcement (linting, formatting, and tests before every commit)
- **Commitizen** — Standardized commit messages and automated changelog/versioning
- **Environment Management** — Stage-based configuration system supporting development and production environments
- **MkDocs Documentation** — Documentation with Material theme and automated generation
- **Makefile Automation** — Simplified command interface for common development tasks



## 📋 Requirements

- Python 3.10+
- [uv](https://docs.astral.sh/uv) package manager
- Docker (optional, for containerized development)
- Git


## ⚠️ Important

> **Note**: This is a boilerplate template.
> After cloning or generating your project, remember to:
> - Update your project name in `pyproject.toml` and `docker-compose.yml`
> - Replace this README with documentation specific to your project
> - Configure environment variables in `.env.development` and `.env.production`
> - Customize the Makefile commands as needed for your project


## ⚡ Quick Start

1. **Clone the repository:**
    ```bash
    git clone https://github.com/python-boilerplate/uv-template
    cd uv-template
    ```

2. **Initialize the project:**
    ```bash
    make init
    ```
    This will:
    - Install all dependencies using uv
    - Set up pre-commit hooks

3. **Set up environment variables:**
   ```bash
   cp example.env .env.development
   # Edit .env.development as needed
   ```

4. **Run the application:**
   ```bash
   make run
   ```


## 🧑‍💻 Usage Options:

### Clone Repository:

1. **Use this Template:**
   Click “Use this template” on GitHub to create your own repository based on this boilerplate.

2. **Clone Directly:**
   Use the standard `git clone` command to clone this repository locally to your machine.

---

### Development Options:

1. **Local Development:**
   Use `uv` and Makefile for local development without containers.

2. **Dockerized Development:**
   Utilize Docker and Docker Compose for isolated, containerized workflows.
   See [Docker instructions](https://monok8i.github.io/python-boilerplate/docker/) in the documentation.

3. **GitHub Codespaces:**
   Launch in [GitHub Codespaces](https://github.com/features/codespaces) for instant cloud-based development with pre-configured devcontainer support.

## 📚 Documentation

**For detailed guides and advanced scenarios, see the [full documentation](https://monok8i.github.io/python-boilerplate/).**


## 📄 License
[MIT License](./LICENSE) &mdash;
Yurii | monok8i 🦋
