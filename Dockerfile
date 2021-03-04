FROM python:3.7-slim
RUN mkdir /app
WORKDIR /app

RUN apt-get update && apt-get install -y git python3-pip

RUN pip3 install poetry
COPY poetry.lock pyproject.toml entrypoint.sh /app/
WORKDIR /app/
RUN poetry install

COPY /src /app/src

ENTRYPOINT ["sh", "entrypoint.sh"]
