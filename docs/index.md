# Python Boilerplate

A comprehensive template for quickly starting new Python projects with modern development tools and best practices.

**Documentation**: [https://monok8i.github.io/python-boilerplate/](https://monok8i.github.io/python-boilerplate/)

![Python Boilerplate](https://img.shields.io/badge/python-3.10+-blue.svg)
![uv](https://img.shields.io/badge/uv-0.7.13-purple.svg)
![Docker](https://img.shields.io/badge/docker-enabled-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
[![GitHub Actions Status](https://github.com/monok8i/python-boilerplate/actions/workflows/code-quality.yml/badge.svg)](https://github.com/monok8i/python-boilerplate/actions/workflows/code-quality.yml)
[![GitHub Actions Status](https://github.com/monok8i/python-boilerplate/actions/workflows/codeql.yml/badge.svg)](https://github.com/monok8i/python-boilerplate/actions/workflows/codeql.yml)


## 🚀 Features

- **Python 3.10+**
- **[uv](https://docs.astral.sh/uv/)** - Ultra-fast Python package installer and dependency resolver
- **Docker Support** - Multi-stage Dockerfiles for both local development and clean production containers
- **GitHub Actions CI/CD** - Automated pipelines for code quality checks, testing, security scanning, and Python compatibility validation
- **Dev Containers** - Pre-configured development environment with VS Code integration
- **Code Quality Tools** - Integrated linting with `Ruff`, static type checking with `MyPy`, comprehensive testing with `Pytest` and Python compatibility validation with `Vermin`
- **Pre-commit Hooks** - Automated code quality enforcement that runs linting, formatting, and tests before each commit
- **Commitizen** - Standardized commit messages following conventional commits specification with automated changelog generation and versioning
- **Environment Management** - Stage-based configuration system supporting development and production environments
- **MkDocs Documentation** - Documentation with Material theme and automated generation
- **Makefile Automation** - Simplified command interface for common development tasks like testing, building, running application

## ⚠️ Important
> **Note**: This is a boilerplate template designed to be cloned and customized for your specific project needs. After cloning, make sure to:
>- Update project name in `pyproject.toml` and `docker-compose.yml`
>- Replace this README with documentation specific to your project
>- Configure environment variables in `.env.development` and `.env.production`

## 📋 Requirements

- Python 3.10+
- [uv](https://docs.astral.sh/uv/getting-started/installation/) package manager
- Docker (optional, for containerized development)
- Git

## 🛠️ Quick Start

1. **Clone the repository:**
```bash
git clone https://github.com/monok8i/python-boilerplate.git
cd python-boilerplate
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
   # Edit .env.development with your settings (more about docker and .env variables see below)
   ```

4. **Run the application:**
   ```bash
   make run
   ```

## 📦 Installation

### Using uv (Recommended)

```bash
# Install uv if you haven't already:
curl -LsSf https://astral.sh/uv/install.sh | sh

# Clone the repository:
git clone https://github.com/monok8i/python-boilerplate.git
cd python-boilerplate

# Set up environment variables:
cp example.env .env.development
# Edit .env.development with your settings (more about docker and .env variables see below)

# Install dependencies and set up pre-commit hooks:
make init

# Run the application (without docker):
make run
```

### Using Docker

- Development environment
    ```bash
    # Set up environment variables:
    cp example.env .env.development
    # Edit .env.development with your settings (more about docker and .env variables see below)

    # Build and start the development container:
    make dev-build
    make dev-up
    ```

- Production environment

    ```bash
    # Set up environment variables:
    cp example.env .env.production
    # Edit .env.production with your settings (more about docker and .env variables see below)

    # Build and start the production container:
    make prod-build
    make prod-run
    ```

## 🎯 Usage

### Local Development

```bash
# Run the application
make run

# Run tests
make test

# Lint code
make lint

# Format code
make format

# Type check
make typecheck
```

### Docker Development

```bash
# Build and start development container
make dev-build
make dev-up

# View logs
make dev-logs

# Execute commands in container
make dev-exec

# Stop container
make dev-stop
```

## 🧪 Testing

The project uses pytest for testing with support for both sync and async functions:

```bash
# Run all tests
make test

# Run tests with verbose output
uv run pytest -v

# Run specific test file
uv run pytest tests/test_func.py
```

## 🔧 Code Quality

### Linting and Formatting

```bash
# Check code style with Ruff
make lint

# Auto-format code with Ruff
make format

# Type check with MyPy
make typecheck
```

### Pre-commit Hooks

Pre-commit hooks automatically run before each commit:
- Ruff linting and formatting
- MyPy type checking
- Pytest testing

```bash
# Install hooks (done automatically with make init)
uv run pre-commit install

# Run hooks manually
uv run pre-commit run --all-files
```

## 📚 Documentation

Documentation is built with MkDocs and Material theme:

```bash
# Serve documentation locally
uv run mkdocs serve

# Build documentation
uv run mkdocs build
```

Visit `http://localhost:8000` to view the documentation.

## 🏗️ Project Structure

```
├── .devcontainer/          # Dev container configuration
├── .github/                # GitHub Actions workflows
│   ├── workflows/
│   │   ├── code-quality.yml    # Lint, type check, test
│   │   ├── codeql.yml          # Security analysis
│   │   └── compatibility.yml   # Python version compatibility
│   └── dependabot.yml      # Dependency updates
├── docker/                 # Docker configuration
├── docs/                   # MkDocs documentation
├── src/                    # Source code
│   ├── config/             # Configuration management
│   │   ├── __init__.py
│   │   └── env.py          # Environment variables
│   ├── utils/              # Utility functions
│   │   ├── logging/        # Logging setup
│   │   └── __init__.py
│   └── factory.py          # Factory pattern implementation
├── tests/                  # Test files
├── dev.Dockerfile          # Development Docker image
├── prod.Dockerfile         # Production Docker image
├── docker-compose.yml      # Docker Compose configuration
├── Makefile               # Task automation
├── pyproject.toml         # Project configuration
├── __main__.py            # Application entry point
└── README.md              # This file
```

## ⚙️ Configuration

### Environment Variables

The project supports environment-based configuration:

- **Development**: `.env.development`
- **Production**: `.env.production`

Set the `APP_STAGE` environment variable to switch between configurations:

```bash
export APP_STAGE=development  # or production
```

### Project Configuration

Main configuration is in `pyproject.toml`:

- **Dependencies**: Project and development dependencies
- **Ruff**: Linting and formatting rules
- **MyPy**: Type checking configuration
- **Pytest**: Testing configuration
- **Commitizen**: Conventional commits

## 🚀 CI/CD

GitHub Actions workflows:

- **Code Quality** (`code-quality.yml`): Runs on every push/PR
  - Linting with Ruff
  - Type checking with MyPy
  - Testing with Pytest

- **CodeQL** (`codeql.yml`): Security analysis
  - Scans for vulnerabilities
  - Runs on schedule and code changes

- **Compatibility** (`compatibility.yml`): Python version compatibility
  - Checks minimum Python version requirements
  - Uses Vermin for analysis

## 🐳 Docker Support

### Development Container

Multi-stage build optimized for development:
- Includes all development dependencies
- Hot reload support
- Volume mounting for live code changes

### Production Container

Optimized production image:
- Minimal dependencies
- No development tools
- Security hardened

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Run tests: `make test`
5. Run code quality checks: `make lint format typecheck`
6. Commit your changes: `git commit -m 'Add amazing feature'`
7. Push to the branch: `git push origin feature/amazing-feature`
8. Open a Pull Request

### Development Guidelines

- Follow PEP 8 style guide
- Write type hints for all functions
- Add tests for new functionality
- Update documentation as needed
- Use conventional commits

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [uv](https://github.com/astral-sh/uv) for fast Python package management
- [Ruff](https://github.com/astral-sh/ruff) for blazing fast linting and formatting
- [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) for beautiful documentation

---

Made with ❤️ by [monok8i](https://github.com/monok8i)