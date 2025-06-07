PROJECT_NAME = python-boilerplate
CONTAINER_NAME = py-blplt
d = docker
dc = docker compose

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

docker-build:
	$(d) build -t $(PROJECT_NAME) .

docker-bash:
	$(d) run --rm -it --env-file .env $(PROJECT_NAME) /bin/bash

docker-run:
	$(d) run --rm -it --env-file .env $(PROJECT_NAME)

docker-logs:
	$(d) logs -f $(CONTAINER_NAME)

compose-build:
	$(dc) up --build -d

compose-up:
	$(dc) up -d

compose-stop:
	$(dc) stop

compose-down:
	$(dc) down

clean:
	find . -type d -name '__pycache__' -exec rm -rf {} +
	rm -rf .mypy_cache .ruff_cache .pytest_cache

.PHONY: run test lint format typecheck check docker-build docker-bash docker-run compose-build compose-up compose-stop compose-down clean
