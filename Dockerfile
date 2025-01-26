# Use the latest OpenJDK image (this will always pull the latest version available)
FROM openjdk:latest

# Install Maven
RUN apt-get update && apt-get install -y maven

# Set the working directory
WORKDIR /myapp

# Expose port 8080 for Spring Boot
EXPOSE 8080

# Default command to run the Spring Boot application using Maven
CMD ["mvn", "spring-boot:run"]
