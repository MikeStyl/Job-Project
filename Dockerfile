
# Use a base Python image
FROM python:3.11.5

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir --upgrade Flask Jinja2

# Expose port 8080
EXPOSE 8080

# Define the command to run when the container starts
CMD ["python", "hello_world.py"]
