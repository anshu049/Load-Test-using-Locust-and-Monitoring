# Use Python 3.9 as the base image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask application code into the container
COPY app.py .

# Expose the port on which the Flask app will run (5000 by default)
EXPOSE 5000

# Run the Flask application when the container starts
CMD ["python", "app.py"]

