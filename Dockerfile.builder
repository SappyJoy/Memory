FROM node:20-slim

# Install inotify-tools to watch for file changes
RUN apt-get update && apt-get install -y inotify-tools

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci

# Copy the rest of the application files
COPY . .

# Copy and set permissions for the build script
COPY build.sh /app/build.sh
RUN chmod +x /app/build.sh

CMD ["./build.sh"]

