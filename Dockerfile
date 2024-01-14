# Use Ubuntu as the base image
FROM ubuntu

# Install necessary dependencies
RUN apt-get update \
    && apt-get install -y openjdk-11-jre-headless maven apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory

# Build the Java application with Maven

# Copy the compiled artifacts to Apache2 server directory
RUN cp target/NETFLIX-5.4.3.war /var/www/html

# Expose the necessary port
EXPOSE 80

# Start Apache2
CMD ["apache2ctl", "-D", "FOREGROUND"]
