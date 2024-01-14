FROM ubuntu:20.04

# Set the working directory
WORKDIR /app

# Update the package list and install OpenJDK 11
RUN apt-get update \
    && apt-get install -y openjdk-11-jre-headless \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy your application JAR file into the container
COPY target/your-app.jar /app

# Expose the port your application will run on
EXPOSE 8080

# Command to run your application
CMD ["java", "-jar", "your-app.jar"]
