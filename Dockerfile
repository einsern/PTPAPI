FROM python:3 as base

ENV PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1

# Build virtual env
FROM base as builder

ENV PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=1.3.0

RUN pip install "poetry==$POETRY_VERSION"
RUN python -m venv /venv
ENV VIRTUAL_ENV="/venv"

WORKDIR /app

COPY poetry.lock pyproject.toml ./

RUN poetry install -n --no-ansi --no-root -E origin

COPY . ./

RUN poetry build && /venv/bin/pip install dist/*.whl

# Install into final image
FROM base as final

ENV PATH="/venv/bin:${PATH}"
ENV VIRTUAL_ENV="/venv"

RUN bash -c 'echo -e "[Main]\nbaseURL=https://passthepopcorn.me/\ndownloadDirectory=/data/" > ~/.ptpapi.conf'

RUN curl -sSL https://github.com/bcicen/tinycron/releases/download/v0.4/tinycron-0.4-linux-amd64 > /usr/local/bin/tinycron && chmod +x /usr/local/bin/tinycron
COPY ./resources/archiver.sh /usr/local/bin/
COPY --from=builder /venv /venv
