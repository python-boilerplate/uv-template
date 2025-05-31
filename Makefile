PROJECT_NAME = python-boilerplate

run:
	uv run __main__.py

lint:
	uv run ruff check --config=pyproject.toml --fix ./src/

format:
	uv run ruff format --config=pyproject.toml ./src/

typecheck:
	uv run mypy --config-file=pyproject.toml --explicit-package-bases ./src/

docker-build:
	docker build -t $(PROJECT_NAME) .

docker-run:
	docker run --rm -it --env-file example.env $(PROJECT_NAME)

compose-build:
	docker compose up --build -d

compose-up:
	docker compose up -d

compose-stop:
	docker compose stop

compose-down:
	docker compose down

clean:
	find . -type d -name '__pycache__' -exec rm -rf {} +
	rm -rf .mypy_cache .ruff_cache .pytest_cache

.PHONY: run lint format typecheck check docker-build docker-run compose-build compose-up compose-stop compose-down clean
