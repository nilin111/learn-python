# Base image
FROM python:3.8-slim-buster

# Working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files
COPY . .

# Expose the server port
EXPOSE 8000

# Command to start the server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "learning_log.wsgi"]

# 安装libpq-dev
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/*
