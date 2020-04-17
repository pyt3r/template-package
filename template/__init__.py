def _get_version():
    import os.path
    from pkg_resources import get_distribution
    here    = os.path.dirname(__file__)
    package = os.path.basename( here )
    return get_distribution( package ).version


__version__ = _get_version()
