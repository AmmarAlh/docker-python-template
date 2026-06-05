# Repository defaults

This repo is a template for Dockerized Python applications.

Defaults:
- Python 3.11+
- Ruff for linting and formatting
- Pyright for type checking
- pytest for tests
- Pylint only for selected design smells
- VS Code Dev Containers for development
- Azure DevOps for CI
- Multi-stage Dockerfile with separate dev and runtime targets

Coding rules:
- Use type hints where practical
- Prefer small, testable modules
- Prefer pathlib over os.path
- Avoid hidden global state
- Prefer clear names over clever code
- Use logging in application code instead of print unless it is a tiny example