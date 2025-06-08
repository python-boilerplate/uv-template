PROJECT_NAME = python-boilerplate
DEV_TAG = dev
PROD_TAG = prod
DEVCONTAINER_NAME = dev
PRODCONTAINER_NAME = prod
d = docker
dc = docker compose
ur = uv run

# ============ Commands for local development

run:
	$(ur) __main__.py

test:
	$(ur) pytest -v

lint:
	$(ur) ruff check --config=pyproject.toml --fix ./src/

format:
	$(ur) ruff format --config=pyproject.toml ./src/

typecheck:
	$(ur) mypy --config-file=pyproject.toml --explicit-package-bases ./src/

dev-logs:
	$(d) logs -f $(DEVCONTAINER_NAME)

dev-exec:
	$(d) exec -it $(DEVCONTAINER_NAME) /bin/bash

dev-bash:
	$(d) run --rm -it --env-file .env.development $(PROJECT_NAME):$(DEV_TAG) /bin/bash

dev-build:
	cp dev.dockerignore .dockerignore
	$(dc) --env-file=.env.development build

dev-up:
	$(dc) --env-file=.env.development up -d

dev-stop:
	$(dc) stop

dev-down:
	$(dc) down

clean:
	find . -type d -name '__pycache__' -exec rm -rf {} +
	rm -rf .mypy_cache .ruff_cache .pytest_cache


# ============ Commands to check prod image

prod-build:
	cp prod.dockerignore .dockerignore
	$(d) build -t $(PROJECT_NAME):$(PROD_TAG) -f prod.Dockerfile .

prod-run:
	$(d) run -d --env-file .env.production --name $(PRODCONTAINER_NAME) $(PROJECT_NAME):$(PROD_TAG)

prod-exec:
	$(d) exec -it $(PRODCONTAINER_NAME) /bin/bash

prod-bash:
	$(d) run --rm -it --entrypoint bash --env-file .env.production --name $(PRODCONTAINER_NAME) $(PROJECT_NAME):$(PROD_TAG)

prod-logs:
	$(d) logs -f $(PRODCONTAINER_NAME)

.PHONY: run test lint format typecheck dev-logs dev-exec dev-bash dev-build dev-up dev-stop dev-down clean prod-build prod-run
