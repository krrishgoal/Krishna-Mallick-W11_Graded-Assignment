# Development pc has python 3.10.12 so took base image of 3.10
FROM python:3.10-slim

# seting working directory
WORKDIR /app

# Copy the current directory content into the container /app
COPY . /app

# installing packages in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Exposing Port 80 outside to world outside the container
EXPOSE 80

# Define enviroment variable
ENV NAME venv

# Run app.py when the container launches
CMD ["gunicorn","--workers=2","--bind=0.0.0.0:80","app:app"]