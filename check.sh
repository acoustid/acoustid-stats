#!/usr/bin/env bash

set -eux

poetry run pylint acoustid_stats/ tests/
poetry run flake8 acoustid_stats/ tests/
poetry run mypy acoustid_stats/ tests/
poetry run pytest -v tests/
