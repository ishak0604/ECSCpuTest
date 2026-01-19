FROM public.ecr.aws/docker/library/python:3.11-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY src/ .

RUN useradd -m appuser
USER appuser

EXPOSE 8080

CMD ["python", "app.py"]
