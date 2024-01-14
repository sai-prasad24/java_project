# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update \
    && apt-get install -y openjdk-11-jre-headless maven apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the application source code
COPY . /app

# Build the Java application with Maven
RUN mvn clean install

# Copy the compiled artifacts to Apache2 server directory
RUN cp target/your-app.war /var/www/html

# Expose the necessary port
EXPOSE 80

# Start Apache2
CMD ["apache2ctl", "-D", "FOREGROUND"]
