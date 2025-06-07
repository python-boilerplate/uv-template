FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

WORKDIR /app

# Copy all files (can be made more selective)
COPY . /app

# Install all dependencies, including dev
RUN uv sync

# Add dev tools if you need anything else
# RUN apt-get update && apt-get install -y vim git

ENV PATH="/app/.venv/bin:$PATH"
ENV APP_STAGE="development"

# For interactive work - bash or shell
CMD ["/bin/sh", "docker/docker-entrypoint.sh"]