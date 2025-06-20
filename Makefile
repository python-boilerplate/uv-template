DOCKER_PROJECT_NAME=python-boilerplate
DOCKER_NETWORK_NAME=project-network
DOCKER_DEV_IMAGE_TAG=dev
DOCKER_PROD_IMAGE_TAG=prod
DOCKER_DEV_CONTAINER_NAME=dev
DOCKER_PROD_CONTAINER_NAME=prod

d = docker
dc = docker compose
ur = uv run

.DEFAULT_GOAL := help

##@ Setup project
init: ## Initialize the project
	uv sync
	$(ur) pre-commit install --install-hooks
	$(ur) pre-commit autoupdate

##@ Local development
run: ## Run the application without Docker
	$(ur) __main__.py

test: ## Run the tests
	$(ur) pytest -v

lint: ## Run the linter
	$(ur) ruff check --config=pyproject.toml --fix ./src/

format: ## Format the code
	$(ur) ruff format --config=pyproject.toml ./src/

typecheck: ## Run the type checker
	$(ur) mypy --config-file=pyproject.toml ./src/

dev-logs: ## View development container logs
	$(d) logs -f $(DOCKER_DEV_CONTAINER_NAME)

dev-exec: ## Execute a command in the development container
	$(d) exec -it $(DOCKER_DEV_CONTAINER_NAME) /bin/bash

dev-bash: ## Start a bash session in the development container
	$(d) run --rm -it --env-file .env.development $(DOCKER_PROJECT_NAME):$(DOCKER_DEV_IMAGE_TAG) /bin/bash

dev-build: ## Build the development container
	cp dev.dockerignore .dockerignore
	$(dc) --env-file=.env.development build

dev-up: ## Start the development container
	$(dc) --env-file=.env.development up -d

dev-stop: ## Stop the development container
	$(dc) stop

dev-down: ## Stop and remove the development container
	$(dc) down

clean: ## Clean up the project (cache)
	find . -type d -name '__pycache__' -exec rm -rf {} +
	rm -rf .mypy_cache .ruff_cache .pytest_cache

##@ Production
prod-build: ## Build the production Docker image
	cp prod.dockerignore .dockerignore
	$(d) build -t $(DOCKER_PROJECT_NAME):$(DOCKER_PROD_IMAGE_TAG) -f prod.Dockerfile .

prod-run: ## Run the production Docker container
	$(d) run -d --env-file .env.production --name $(DOCKER_PROD_CONTAINER_NAME) $(DOCKER_PROJECT_NAME):$(DOCKER_PROD_IMAGE_TAG)

prod-exec: ## Execute a command in the production container
	$(d) exec -it $(DOCKER_PROD_CONTAINER_NAME) /bin/bash

prod-bash: ## Start a bash session in the production container
	$(d) run --rm -it --entrypoint bash --env-file .env.production --name $(DOCKER_PROD_CONTAINER_NAME) $(DOCKER_PROJECT_NAME):$(DOCKER_PROD_IMAGE_TAG)

prod-logs: ## View production container logs
	$(d) logs -f $(DOCKER_PROD_CONTAINER_NAME)

##@ Git
commit: ## Do commit with conventional commit message
	$(ur) cz commit

bump: ## Bump the version and update CHANGELOG.md
	$(ur) cz bump

##@ Documentation
serve: ## Serve the documentation locally
	$(ur) mkdocs serve

##@ Help
help: ## Show this help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: commit bump help run test lint format typecheck dev-logs dev-exec dev-bash dev-build dev-up dev-stop dev-down clean prod-build prod-run
