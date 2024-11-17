# 1. Dockerfile
FROM python:3.9-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy application files
COPY . .

# Expose port for Streamlit
EXPOSE 8501

# Command to run the application
CMD ["streamlit", "run", "Streamlit.py", "--server.port=8501", "--server.address=0.0.0.0"]