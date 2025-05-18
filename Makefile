dev:
	modern_python_boilerplate

prod:
	modern_python_boilerplate

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
	pre-commit

dockerbuild:
	docker build -t modern-python-boilerplate:latest .

dockerrun:
	docker run --rm modern-python-boilerplate:latest

allci:
	$(MAKE) check
	$(MAKE) format
	$(MAKE) type
	$(MAKE) cov
