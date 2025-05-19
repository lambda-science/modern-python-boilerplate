.PHONY: help

help:
	@echo "Usage:"
	@echo "  make dev                Run the package with developer settings"
	@echo "  make prod               Run the pacakge with production settings"
	@echo "  make test               CI: Run tests"
	@echo "  make cov                CI: Run test and calculate coverage"
	@echo "  make check              CI: Lint the code"
	@echo "  make format             CI: Format the code"
	@echo "  make type               CI: Check typing"
	@echo "  make doc                Run local documentation server"
	@echo "  make build              Build the package wheel before publishing to Pypi"
	@echo "  make publish            Publish package to Pypi"
	@echo "  make dockerbuild        Build the docker image"
	@echo "  make dockerrun          Run the docker image"
	@echo "  make allci              Run all CI steps (check, format, type, test coverage)"

dev:
	uv run modern_python_boilerplate

prod:
	uv run modern_python_boilerplate

test:
	uv run pytest tests/

cov:
	uv run pytest --cov=src/modern_python_boilerplate tests/ --cov-report=term-missing

check:
	uv run ruff check $$(git diff --name-only --cached -- '*.py')

format:
	uv run ruff format $$(git diff --name-only --cached -- '*.py')

type:
	uv run ty check $$(git diff --name-only --cached -- '*.py')

doc:
	uvx --with mkdocstrings  --with mkdocs-material --with mkdocstrings-python --with mkdocs-include-markdown-plugin mkdocs serve

build:
	uv build

publish:
	uv publish

commit:
	uv run pre-commit

dockerbuild:
	docker build -t modern-python-boilerplate:latest .

dockerrun:
	docker run --rm modern-python-boilerplate:latest

allci:
	$(MAKE) check
	$(MAKE) format
	$(MAKE) type
	$(MAKE) cov
