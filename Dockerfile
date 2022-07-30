FROM python:latest

RUN set -xe

RUN curl -sSL https://install.python-poetry.org | python3 - --git https://github.com/python-poetry/poetry.git@master

ENV PATH="/root/.local/bin:$PATH"

RUN poetry --version

COPY . .

WORKDIR dilbert

RUN poetry install

CMD ["poetry", "run", "start-bot"]
