# Environment Management

Managing environment variables and configuration files is crucial for building robust and flexible Python applications.

This template supports **stage-based environment configuration** (development and production) using the `APP_STAGE`
variable, and loads the appropriate `.env.*` file automatically.

---

## How environment loading works in this project

### **Stage-based Environment Selection**

- The environment is controlled by the `APP_STAGE` variable, which can be set to values like `development` or `production`.
- Depending on `APP_STAGE`, the app loads the correct environment file:
    - `APP_STAGE=development` → loads `.env.development`
    - `APP_STAGE=production` → loads `.env.production`

---

### **Where is this implemented?**

Environment loading logic is implemented in `src/config/env.py`.

??? example "Key logic from your code:"

    ```python title="src/config/env.py"
    import os
    from pathlib import Path
    from typing import Final

    from environs import Env

    ABS_PATH: Final[Path] = Path(__file__).resolve().parent.parent.parent

    APP_STAGE: Final[str] = os.getenv("APP_STAGE", "development")

    ENV_FILE_MAP: Final[dict[str, Path]] = {
        "development": ABS_PATH / ".env.development",
        "production": ABS_PATH / ".env.production",
    }

    ENV_PATH: Final[Path] = ENV_FILE_MAP[APP_STAGE]

    # or you can use this way to load the environment file:
    # ENV_PATH: Final[Path] = ABS_PATH / f".env.{APP_STAGE}"

    if not ENV_PATH.exists():
        raise FileNotFoundError(f"Environment file not found: {ENV_PATH}")

    env = Env()
    env.read_env(ENV_PATH)
    ```

- This code checks the value of `APP_STAGE`, determines the corresponding `.env.*` file, and loads it using [environs](https://github.com/sloria/environs).
- If the file does not exist, it raises an error and your application run failed.

---

### **How to use it**

!!! example "!"

    === "Manually"
        - To switch environments, just set `APP_STAGE` before running your app:
            ```bash
            export APP_STAGE=production
            make run
            ```
        - Or, pass it inline:
            ```bash
            APP_STAGE=production make run
            ```

    === "Docker"
        - If you run your app in Docker, you can set `APP_STAGE` in your `docker-compose.yml` or `Dockerfile`:
        === "docker-compose.yml"
            ```yaml
            environment:
              - APP_STAGE=production
            ```
        === "Dockerfile"
            ```dockerfile
            ENV APP_STAGE=production
            ```

    !!! warning "Important"
        - You needn't set `APP_STAGE` variable if you use `development` stage, it automatically will load `.env.development` file, but make sure if your file exists.

---

## Alternative: Using Pydantic Settings

While the current approach is simple and robust, modern Python projects often use **Pydantic** (and [pydantic-settings](https://docs.pydantic.dev/latest/usage/pydantic_settings/)) for type-safe, validated environment management.

!!! warning "Dependency"
    - If you want to use Pydantic Settings, you need to install `pydantic-settings` package:
        ```bash
        uv add pydantic-settings
        ```

??? example "Example Implementation with Pydantic:"

    ```python title="src/config/env.py"
    """Environment configuration module for loading environment variables."""

    import os
    from pathlib import Path
    from typing import Final

    from pydantic import field_validator
    from pydantic_core.core_schema import FieldValidationInfo
    from pydantic_settings import BaseSettings, SettingsConfigDict

    ABS_PATH: Final[Path] = Path(__file__).resolve().parent.parent.parent

    APP_STAGE: Final[str] = os.getenv("APP_STAGE", "development")


    class BaseEnvSettings(BaseSettings):
        """
        Environment configuration settings.

        This class loads environment variables from a specified file based on the application stage.
        """  # noqa: E501

        ENV_PATH: Path = ABS_PATH / f".env.{APP_STAGE}"

        @field_validator("ENV_PATH", mode="before")
        @classmethod
        def check_env_path_exists(cls, v: Path, info: FieldValidationInfo) -> Path:
            """
            Validates that the provided environment file path exists.

            Args:
                v (Path): The path to the environment file.
                info (FieldValidationInfo): Additional validation information.

            Raises:
                FileNotFoundError: If the environment file does not exist.

            Returns:
                Path: The validated environment file path.
            """

            if not v.exists():
                raise FileNotFoundError(
                    f"Environment file not found: {cls.ENV_PATH}")
            return v

        model_config = SettingsConfigDict(
            env_file=ENV_PATH,
            env_file_encoding="utf-8",
            env_nested_delimiter="__",
            extra="ignore",
            case_sensitive=True
        )


    class Settings(BaseEnvSettings):
        """Application settings."""

        YOUR_VARIABLE: str  # Example variable, add your own

    env = Settings()

    ```

## Description of environment variables used in this project

- `APP_STAGE` - The current application stage, which determines which environment file to load (e.g., `development`, `production`).

- `DOCKER_PROJECT_NAME` - The name of your project, used for Docker image naming and container management.
- `DOCKER_NETWORK_NAME` - The name of the Docker network your containers will use.
- `DOCKER_IMAGE_TAG` - The tag for your Docker image, typically the version or stage (e.g., `latest`, `dev`, `prod`).
- `DOCKER_CONTAINER_NAME` - The name of the Docker container, which can be used to easily identify and manage it.

!!! note "Note"
    - All these docker variables are used in `docker-compose.yml` and `Makefile` for creating a Docker image and running a container
    - In `Makefile` these variables are defined directly in the file, they are not loaded from the .env files.


**More about Docker and his variables you can see in [Docker section](./docker.md)**

**More about Makefile you can see in [Makefile section](./makefile.md)**

## References

- [environs](https://github.com/sloria/environs)
- [Pydantic Settings documentation](https://docs.pydantic.dev/latest/usage/pydantic_settings/)