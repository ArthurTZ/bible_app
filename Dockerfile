# Imagem base
FROM python:3.12-alpine

WORKDIR /app

# Atualizar pip e instalar poetry
RUN pip install --upgrade pip && \
    pip install poetry
RUN apk add --no-cache gcc musl-dev linux-headers
# Instalar o psutil sem usar o PEP 517
RUN pip install --no-cache-dir psutil==5.9.7

# Copiar os arquivos do Poetry
COPY pyproject.toml poetry.lock* /app/

# Configurar o Poetry e instalar as dependências
RUN poetry config virtualenvs.create false && \
    poetry install --no-dev

COPY . .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
