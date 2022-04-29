#!/usr/bin/env bash

set -eux

poetry run pylint acoustid_stats/
poetry run flake8 acoustid_stats/
poetry run mypy acoustid_stats/
poetry run pytest -v acoustid_stats/
