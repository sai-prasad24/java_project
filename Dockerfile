# Use an official Maven image with OpenJDK 11 as a base image
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the project files into the container
COPY . .

# Build the Maven project
RUN mvn clean install

# Use an official Apache image as the base image
FROM httpd:2.4

# Copy the built artifacts from the Maven image to the Apache image
COPY --from=build /usr/src/app/target/*.war /usr/local/apache2/htdocs/

# Expose port 80 for Apache
EXPOSE 80

# Start Apache when the container runs
CMD ["httpd-foreground"]
