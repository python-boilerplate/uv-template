ARG PYTHON_VERSION=3.12.9
FROM python:${PYTHON_VERSION}-slim

# Download curl
RUN apt-get update && apt-get install -y curl

# Download the latest uv installer
ADD https://astral.sh/uv/install.sh /uv-installer.sh

# Run the installer then remove it
RUN sh /uv-installer.sh && rm /uv-installer.sh

# Ensure the installed binary is on the `PATH`
ENV PATH="/root/.local/bin:${PATH}"

# Set the working directory
WORKDIR /app/

# Copy project files
COPY . .

# Sync project dependencies with new virtual environment
RUN uv sync --frozen

# Expose port
EXPOSE 8000

# Start the application
ENTRYPOINT ["uv", "run", "__main__.py"]

# ENTRYPOINT ["/bin/sh", "./scripts/docker-entrypoint.sh"]