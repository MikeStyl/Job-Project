# Use a base Python image
FROM python:3.8-slim

# Set the working directory
WORKDIR /app

# Copy the Python app into the container
COPY hello_world.py .

# Install Flask
RUN pip install Flask

# Expose port 8080
EXPOSE 8080

# Define the command to run when the container starts
CMD ["python", "hello_world.py"]
