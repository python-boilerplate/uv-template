PROJECT_NAME = python-boilerplate
DEV_NAME = dev
PROD_NAME = prod
d = docker
dc = docker compose

# ============ Commands for local development

run:
	uv run __main__.py

test:
	uv run pytest -v

lint:
	uv run ruff check --config=pyproject.toml --fix ./src/

format:
	uv run ruff format --config=pyproject.toml ./src/

typecheck:
	uv run mypy --config-file=pyproject.toml --explicit-package-bases ./src/

dev-logs:
	$(d) logs -f $(DEV_NAME)

dev-exec:
	$(d) exec -it $(DEV_NAME) /bin/bash

dev-bash:
	$(d) run --rm -it --env-file .env.development $(PROJECT_NAME):dev /bin/bash

dev-build:
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
	$(d) build -t $(PROJECT_NAME):prod -f prod.Dockerfile .

prod-run:
	$(d) run -it --env-file .env.production --name $(PROD_NAME) $(PROJECT_NAME):prod


.PHONY: run test lint format typecheck check docker-build docker-bash docker-run compose-build compose-up compose-stop compose-down clean
