import time
from collections.abc import Callable


def retry(action: Callable[[], object], attempts: int = 3) -> object:
    for attempt in range(attempts):
        try:
            return action()
        except Exception:
            if attempt == attempts - 1:
                raise
            time.sleep(2**attempt)
    raise RuntimeError('unreachable')


def merge_windows(windows: list[tuple[int, int]]) -> list[tuple[int, int]]:
    merged: list[list[int]] = []
    for start, end in sorted(windows):
        if not merged or start > merged[-1][1]:
            merged.append([start, end])
        else:
            merged[-1][1] = max(merged[-1][1], end)
    return [tuple(window) for window in merged]

print(merge_windows([(1, 4), (3, 7), (10, 12)]))
