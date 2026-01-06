FROM public.ecr.aws/docker/library/python:3.11-slim

WORKDIR /app

# Copy requirements.txt from root
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY src/app.py .

EXPOSE 8080

CMD ["python", "app.py"]
