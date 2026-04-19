# ---------------------------------------------------------------------------
#
# File: Dockerfile
# Component: Docker file 
#
# Brief: docker file with two profiles one for developemt and the other for 
# production
# Author: Ammar Alhannafi
# Created: 2026-04-19
# ---------------------------------------------------------------------------

FROM python:3.11-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /workspace

FROM base AS dev

ARG USERNAME=vscode
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    bash \
    sudo \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --create-home --shell /bin/bash "${USERNAME}" \
    && usermod -aG sudo "${USERNAME}" \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/"${USERNAME}" \
    && chmod 0440 /etc/sudoers.d/"${USERNAME}"

USER ${USERNAME}

CMD ["bash"]

FROM base AS runtime

COPY pyproject.toml README.md ./
COPY src ./src

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir .

RUN useradd --create-home --shell /usr/sbin/nologin app

USER app

CMD ["python", "-m", "app.main"]
