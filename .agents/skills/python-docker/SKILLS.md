---
name: python-docker
description: Use for Dockerfiles, Dev Containers, multi-stage builds, and containerized Python workflows.
---

# Python Docker

Use for Docker and devcontainer tasks.

Defaults:
- Dev container mounts the workspace
- Dev image contains tools
- Runtime image contains the app
- Keep dev and runtime responsibilities separate

Rules:
- Prefer multi-stage builds
- Do not copy the full repo into the dev image unless needed at build time
- Copy only required files into the runtime image
- Keep images minimal
- Use .dockerignore
- Give ARG values safe defaults when used in FROM