# Usa a imagem base do Python
FROM python:3.10

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos necessários
COPY ./app /app/app
COPY requirements.txt /app

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta para FastAPI
EXPOSE 8000

# Comando para rodar o servidor FastAPI
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]