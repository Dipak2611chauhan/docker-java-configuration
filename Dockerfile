# Use the slim OpenJDK 21 image
FROM openjdk:21-slim

# Install Maven and clean up after installation to reduce image size
RUN apt-get update \
    && apt-get install -y maven \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /myapp

# Copy the application files into the image
COPY . .

# Expose port 8080 for Spring Boot
EXPOSE 8080

# Default command to run the Spring Boot application using Maven
CMD ["mvn", "spring-boot:run"]
