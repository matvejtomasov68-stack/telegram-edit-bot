FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app
COPY app.zip /tmp/app.zip
RUN python -m zipfile -e /tmp/app.zip /app \
    && pip install --no-cache-dir -r requirements.txt \
    && rm /tmp/app.zip \
    && mkdir -p /data

EXPOSE 8080
CMD ["python", "main.py"]
