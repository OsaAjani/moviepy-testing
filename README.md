
# Dockerized Python Test Environment

This repository provides a Docker container setup to run Python tests for a project. The container simplifies testing by isolating dependencies and ensuring a consistent environment.

## Features

- Runs Python tests using `pytest`.
- Supports additional dependencies via extras like `test`, `optional`, and `doc`.
- Mount your project directory directly into the container for real-time testing.

## Requirements

- Docker installed on your machine.

## Quick Start

### 1. Build the Docker Image

To build the image, run:

```bash
docker build -t project-tester .
```

### 2. Run Tests

To test your project, use the following command:

```bash
docker run --rm -v /path/to/project-root:/app project-tester
```

- Replace `/path/to/project-root` with the absolute path to your project directory.
- The container will:
  1. Mount your project directory into `/app`.
  2. Install dependencies defined in your project (e.g., `.[test, optional, doc]`).
  3. Run the tests using `pytest`.

### 3. Customize Test Runs

You can override the default test command by passing arguments to `pytest`:

```bash
docker run --rm -v /path/to/project-root:/app project-tester python -m pytest -k "specific_test_case"
```

This allows you to target specific test cases or modify the behavior as needed.

## Project Structure

Ensure your project follows a standard structure:

```
project-root/
├── Dockerfile          # Docker configuration
├── requirements.txt    # Dependencies
├── setup.py            # Project setup
├── moviepy/            # Example Python package
│   ├── __init__.py
│   ├── module1.py
│   └── module2.py
├── tests/              # Test cases
│   ├── __init__.py
│   ├── test_module1.py
│   └── test_module2.py
└── README.md           # Documentation
```
