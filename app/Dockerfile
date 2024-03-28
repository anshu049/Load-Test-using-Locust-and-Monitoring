# Use Python 3.9 as the base image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the Flask application code into the container
COPY app.py .

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port on which the Flask app will run (5000 by default)
EXPOSE 5000

# Health check to ensure the container is responsive
HEALTHCHECK --interval=30s --timeout=10s \
  CMD curl -f http://localhost:5000/ || exit 1

# Run the Flask application when the container starts
CMD ["python", "app.py"]
