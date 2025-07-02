# Example taken from https://github.com/astral-sh/uv-docker-example/blob/main/multistage.Dockerfile
# An example using multi-stage image builds to create a final image without uv.

# First, build the application in the `/app` directory.
FROM ghcr.io/astral-sh/uv:python3.10-bookworm-slim AS builder
ENV UV_COMPILE_BYTECODE=1 UV_LINK_MODE=copy

# Disable Python downloads, because we want to use the system interpreter
# across both images. If using a managed Python version, it needs to be
# copied from the build image into the final image; see `standalone.Dockerfile`
# for an example.
ENV UV_PYTHON_DOWNLOADS=0

WORKDIR /app
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --locked
COPY . /app
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --locked

FROM ghcr.io/astral-sh/uv:python3.10-bookworm-slim

# Copy the application from the builder
COPY --from=builder --chown=app:app /app /app

WORKDIR /app

# Place executables in the environment at the front of the path
ENV PATH="/app/.venv/bin:$PATH"

# Set the application stage to development
ENV APP_STAGE="development"

CMD ["/bin/sh", "./docker/docker-entrypoint.sh"]