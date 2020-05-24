import yaml
from setuptools import setup, find_packages
from os import path
from io import open

here = path.abspath(path.dirname(__file__))
meta = yaml.load(open(path.join(here, 'conda-recipe', 'meta.yaml'), 'rb'))

package_data = {
    'template': [
        path.join('data', '*.py'), # .py must be added if there is no __init__.py
        path.join('data', '*.txt'),
        path.join('data', '*.yml'), ],
}

setup(
    name         = meta['package']['name'],
    version      = str(meta['package']['version']),
    description  = meta['about']['summary'],
    author       = meta['about']['author'],
    packages     = find_packages(),
    package_data = package_data,
    entry_points = {
        'console_scripts' : meta['build'].get('entry_points', {}),
    }
)
