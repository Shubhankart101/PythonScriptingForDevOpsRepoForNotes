# Question 133: Calculate a SHA-256 file checksum.
from collections import Counter

def solve(records):
    """Implement and test the question-specific algorithm."""
    if not records:
        return {}
    return dict(Counter(item.get("level", "UNKNOWN") for item in records))

if __name__ == "__main__":
    sample = [{"level": "INFO"}, {"level": "ERROR"}, {"level": "INFO"}]
    print(solve(sample))