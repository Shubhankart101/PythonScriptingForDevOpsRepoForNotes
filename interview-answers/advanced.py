from collections.abc import Callable


def health_gated_deploy(release: str, deploy: Callable, health: Callable, rollback: Callable) -> dict:
    deploy(release)
    try:
        if not health(release):
            raise RuntimeError('health check failed')
        return {'release': release, 'status': 'succeeded'}
    except Exception as error:
        rollback(release)
        return {'release': release, 'status': 'rolled-back', 'error': str(error)}


print(health_gated_deploy('1.2.3', lambda _: None, lambda _: True, lambda _: None))
