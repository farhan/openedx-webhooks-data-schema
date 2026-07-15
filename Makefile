.PHONY: help clean upgrade quality requirements test docs selfcheck

.DEFAULT_GOAL := help

help:  ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

clean:  ## Clean build artifacts
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	rm -rf .pytest_cache/
	rm -rf htmlcov/
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete

upgrade:  ## Upgrade python dependencies
	uv run --with edx-lint edx_lint write_uv_constraints pyproject.toml
	uv lock --upgrade

quality:  ## Run linting checks
	uv run tox -e quality

requirements:  ## Sync dev dependencies
	uv sync --group dev
	uv tool install tox --with tox-uv

test:  ## Run tests
	uv run tox -e "py312"

docs:  ## Build documentation
	uv run tox -e docs

selfcheck:  ## check that the Makefile is well-formed
	@echo "The Makefile is well-formed."
