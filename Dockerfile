ARG PYTHON_VERSION=3.10

FROM python:${PYTHON_VERSION} AS package

RUN pip install poetry

ADD . /app
RUN cd /app && \
    poetry export > requirements.txt && \
    poetry build -f wheel

FROM python:${PYTHON_VERSION}

RUN python -m venv /opt/acoustid-stats

RUN --mount=type=bind,from=package,source=/app,target=/app \
    /opt/acoustid-stats/bin/pip install --no-cache-dir -r /app/requirements.txt

RUN --mount=type=bind,from=package,source=/app,target=/app \
    /opt/acoustid-stats/bin/pip install --no-cache-dir /app/dist/*.whl
