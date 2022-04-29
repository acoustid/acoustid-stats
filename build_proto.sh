#!/usr/bin/env bash
set -eux
poetry run python -m grpc.tools.protoc -Iproto/ --python_out=. --grpc_python_out=. --mypy_out=. proto/acoustid_stats/acoustid_stats.proto
