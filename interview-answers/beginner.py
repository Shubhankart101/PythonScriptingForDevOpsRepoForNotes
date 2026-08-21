from collections import Counter
import argparse


def count_levels(records: list[dict]) -> dict[str, int]:
    return dict(Counter(record['level'] for record in records))


def parse_environment() -> str:
    parser = argparse.ArgumentParser()
    parser.add_argument('--environment', choices=['dev', 'test', 'prod'], required=True)
    return parser.parse_args().environment


if __name__ == '__main__':
    print(count_levels([{'level': 'INFO'}, {'level': 'ERROR'}, {'level': 'INFO'}]))
