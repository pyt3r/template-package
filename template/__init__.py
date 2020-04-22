def _get_version():
    import os.path
    from pkg_resources import get_distribution, DistributionNotFound
    here = os.path.dirname(__file__)
    package = os.path.basename(here)

    try:
        version = get_distribution(package).version
    except DistributionNotFound:
        version = here
    return version


__version__ = _get_version()
