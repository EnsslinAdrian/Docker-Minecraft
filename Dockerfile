# Use Eclipse Temurin JRE 21 as the base image
FROM eclipse-temurin:21-jre

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install dependencies, make entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Expose port 25565 for the application
EXPOSE 25565

# Define the entrypoint for the container
ENTRYPOINT ["/app/entrypoint.sh" ]