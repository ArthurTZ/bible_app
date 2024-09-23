# Imagem base
FROM python:3.12-alpine

WORKDIR /app

RUN pip install --upgrade pip && \
    pip install poetry

COPY pyproject.toml poetry.lock* /app/

RUN poetry config virtualenvs.create false && \
    poetry install --no-dev

COPY . .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
