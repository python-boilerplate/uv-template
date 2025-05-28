from src.utils.logging import setup_logging


def main() -> None:
    logger = setup_logging()
    logger.info("Starting the application...")


if __name__ == "__main__":
    main()
