# Use the official Nginx image from Docker Hub
FROM nginx:alpine3.20-otel

# Set the working directory inside the container to /usr/src/app
WORKDIR /usr/src/app  

# Copy the contents of the local "nodeapp" directory to the root directory of the container
COPY . . 

# Expose port 80 to serve the website
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]

