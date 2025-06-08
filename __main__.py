from src.config.env import APP_STAGE, ENV_PATH
from src.utils.logging import setup_logging


def main() -> None:
    logger = setup_logging()
    logger.info("Starting the application...")
    logger.info(f"App stage: {APP_STAGE}")
    logger.info(f"Environment variables loaded from: {ENV_PATH}")


if __name__ == "__main__":
    main()
