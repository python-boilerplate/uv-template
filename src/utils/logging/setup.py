"""Setup logging utilities for the application."""

import logging
import sys

from src.utils.logging.config import (
    DEFAULT_LOGGING_FORMAT,
    DEFAULT_LOGGING_LEVEL,
)


def setup_logging() -> logging.Logger:
    """Set up and configure logging for the application.

    Returns:
        logging.Logger: Configured root logger.
    """

    # Create a logger
    logger = logging.getLogger()
    logger.setLevel(level=DEFAULT_LOGGING_LEVEL)

    # Create console handler and set level to debug
    sh = logging.StreamHandler(sys.stdout)
    sh.setLevel(level=DEFAULT_LOGGING_LEVEL)

    # Create formatter
    formatter = logging.Formatter(DEFAULT_LOGGING_FORMAT)

    # Add formatter to console handler
    sh.setFormatter(formatter)

    # Add console handler to logger
    logger.addHandler(sh)

    return logger
