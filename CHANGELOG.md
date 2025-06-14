## 0.10.0 (2025-06-14)

### Feat

- add commands for doing commit and bumping version
- **env.py**: add checking if .env file exists or not
- **devcontainer.json**: add github cli to devcontainer
- add init command to setup project using one command
- add gitlab workflows
- add gitlab workflows
- remove github workflows

### Fix

- remove themes
- **Makefile**: fix command to initialize project
- **.pre-commit-config.yaml**: fix running pytest
- fix syntax error
- restore github actions for main branch after merge
- set the correct app stage for dev image
- fix adding all env files to dev image
- fix command to run container and add logs command to check prod container logs

## 0.9.0 (2025-06-07)

### Feat

- add loading env variables based on app stage

### Fix

- move getting correct path to env file to another variable
- fix name of workflow

## 0.8.0 (2025-06-05)

### Feat

- change workflow to check minimal python version to run code

## 0.7.0 (2025-06-04)

### Feat

- add workflow for testing on multiple Python versions
- add workflow for linting, type-checking and testing

### Fix

- fix problem with running ruff linter
- fix problem with testing async functions

## 0.6.0 (2025-06-01)

### Feat

- add pytest and configure for testing sync/async functions

## 0.5.0 (2025-05-31)

### Feat

- update vscode profile for devcontainer
- add vscode profile to devcontainer configuration
- configure Dependabot for automated dependency updates and security checks
- setup .devcontainer for codespaces

## 0.4.1 (2025-05-31)

### Fix

- fix error calling entrypoint file inside container

## 0.4.0 (2025-05-31)

### Feat

- add makefile for simplifies running scripts and tasks

## 0.3.1 (2025-05-29)

### Fix

- fix pre-commit hooks

## 0.3.0 (2025-05-29)

### Feat

- add mkdocs --dev dependency for generating documentation

## 0.2.0 (2025-05-28)

### Feat

- add commitizen --dev dependency
- add pre-commit --dev dependency
- initial commit
