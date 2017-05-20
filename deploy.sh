#!/usr/bin/env bash

set -eu -o pipefail

# Create tag
git tag v$(python -c 'import parso; print(parso.__version__)')
git push --tags

# Package and upload to PyPI
rm -rf dist/
python setup.py sdist bdist_wheel
# Maybe do a pip install twine before.
twine upload dist/*
