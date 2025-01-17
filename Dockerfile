# Use the official Python image as the base image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=1

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install pip and upgrade necessary tools
RUN python -m pip install --upgrade pip wheel setuptools

# Set the working directory to /app
WORKDIR /app

# Default command to install dependencies and run tests
CMD python -m pip install ".[test, optional, doc]" && \
    python -m pytest --doctest-glob "moviepy/**/**.py" --cov moviepy --cov-report term-missing
