#!/bin/bash
set -e

# Install dependencies
python -m pip install ".[test, optional, doc]"

# Run the tests
python -m pytest --doctest-glob "moviepy/**/**.py" --cov moviepy --cov-report term-missing
