"""Configuration constants for logging setup."""

from logging import INFO
from typing import Final

DEFAULT_LOGGING_LEVEL: Final[int] = INFO
DEFAULT_LOGGING_FORMAT: Final[str] = (
    "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
)
