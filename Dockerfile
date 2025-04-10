# Use a lightweight base image like Nginx Alpine
FROM nginx:alpine

# Create the directories
RUN mkdir -p /usr/share/nginx/html/mainnet
RUN mkdir -p /usr/share/nginx/html/testnet

# Copy the static files into the appropriate directories
COPY metadata/mainnet/meta.json /usr/share/nginx/html/mainnet/meta.json
COPY metadata/testnet/meta.json /usr/share/nginx/html/testnet/meta.json
COPY metadata/mainnet/emeta.json /usr/share/nginx/html/mainnet/emeta.json
COPY metadata/testnet/emeta.json /usr/share/nginx/html/testnet/emeta.json

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 (default Nginx port)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
