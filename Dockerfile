FROM python:3.13-slim-bullseye
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

ENV UV_COMPILE_BYTECODE=1
ENV UV_NO_CACHE=1

RUN apt update && \
    apt install -y --no-install-recommends \
    build-essential \
    cmake \
    curl \
    gcc \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY README.md /app/
COPY pyproject.toml /app/
RUN uv sync --no-install-project --no-dev
COPY src/modern_python_boilerplate /app/modern_python_boilerplate

EXPOSE 8000

CMD ["uv", "run", "modern_python_boilerplate/main.py"]
