from pathlib import Path
from typing import Final

ABS_PATH: Final[Path] = Path(__file__).resolve().parent.parent.parent

ENV_PATH: Final[Path] = ABS_PATH / ".env"

print(ENV_PATH)
