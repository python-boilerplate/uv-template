"""Environment configuration module for loading environment variables."""

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

if not ENV_PATH.exists():
    raise FileNotFoundError(f"Environment file not found: {ENV_PATH}")

env = Env()
env.read_env(ENV_PATH)
