# Use a base image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Install curl
RUN apt-get update
RUN apt-get install -y curl

# Copy the script file into the container
COPY script.sh .

# Set executable permissions for the script
RUN chmod +x script.sh

# Define the entry point command
CMD ["./script.sh"]