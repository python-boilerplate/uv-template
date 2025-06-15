<h1 align="center"> Python Boilerplate </h1>

A comprehensive template for quickly starting new Python projects with modern development tools and best practices.

![Python Boilerplate](https://img.shields.io/badge/python-3.10+-blue.svg)
![uv](https://img.shields.io/badge/uv-0.7.13-purple.svg)
![Docker](https://img.shields.io/badge/docker-enabled-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
[![GitHub Actions Status](https://github.com/monok8i/python-boilerplate/actions/workflows/code-quality.yml/badge.svg)](https://github.com/monok8i/python-boilerplate/actions/workflows/code-quality.yml)
[![GitHub Actions Status](https://github.com/monok8i/python-boilerplate/actions/workflows/codeql.yml/badge.svg)](https://github.com/monok8i/python-boilerplate/actions/workflows/codeql.yml)

---

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

---

## 📋 Requirements

- Python 3.10+
- [uv](https://docs.astral.sh/uv) package manager
- Docker (optional, for containerized development)
- Git

---

## ⚠️ Important

!!! note "Note"
    This is a boilerplate template.
    After cloning or generating your project, remember to:

    - Update your project name in `pyproject.toml` and `docker-compose.yml`
    - Replace this README with documentation specific to your project
    - Configure environment variables in `.env.development` and `.env.production`
    - Customize the Makefile commands as needed for your project
---

## ⚡ Quick Start

**Clone the repository:**

```bash
git clone https://github.com/python-boilerplate/uv-template
cd uv-template
```

**Initialize the project:**
```bash
make init
```
- this will install dependencies (with creating virtual environment), set up pre-commit hooks

**Set up environment variables:**
```bash
cp example.env .env.development
# Edit .env.development as needed
```

**Run the application:**
```bash
make run
```

---