from src.config.env import APP_STAGE, ENV_FILE_MAP, env
from src.utils.logging import setup_logging


def main() -> None:
    logger = setup_logging()
    logger.info("Starting the application...")
    logger.info(f"App stage: {env.str('APP_STAGE')}")
    logger.info(
        f"Environment variables loaded from: {ENV_FILE_MAP[APP_STAGE]}"
    )


if __name__ == "__main__":
    main()
