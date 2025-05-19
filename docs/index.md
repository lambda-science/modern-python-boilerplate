---
title: Home
description: ModernPythonBoilerplate
hide:
  - navigation
---

# Modern Python Boilerplate
This is my modern python boilerplate. The goal is to provide a good starting point to develop new python project with most up-to-date tooling, structure and good practices.

# Features
A global `Makefile` to run all the commands. You can run `make help` to see all the available commands.

- **Python Management**
  - UV for python version management `.python-version`
  - UV for dependency management `pyproject.toml`
  - src/package structure
  - Usage of Project Script to directly call the package like `$ modern_python_boilerplate`
- **Continuous Integration `make allci`**
  - Ruff for linting `make check`
  - Ruff for formatting `make format`
  - Ty for type checking `make type`
  - Pytest for testing `make test`
  - Pytest-cov for testing coverage `make cov`
  - Pre-commit hooks to make some checks and formatting code before commits `make commit`
- **Documentation**
  - Mkdocs for documentation building with Markdown `make doc`
  - Automatic build of the API Reference page
- **Running, Publishing and Deploying**
  - Build the pacakge with UV `make build`
  - Publish to PyPi with Twine `make publish`
  - Dockerfile to run in a container `make dockerbuild` and `make dockerrun`
  - DevContainer pre-configured. `.devcontainer/devcontainer.json`

# How to use
1. Delete this README.md to replace by you package one.
2. Replace all occurrence of `modern_python_boilerplate` and `modern-python-boilerplate` and `ModernPythonBoilerplate` by your pacakge name. Including folder names in src/.
3. Get familiar with `make help`, it will show you all the available commands.