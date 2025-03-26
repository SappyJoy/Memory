FROM node:20-slim

# Install inotify-tools to watch for file changes
RUN apt-get update && apt-get install -y inotify-tools rsync

# Create non-root user without fixed UID
# RUN groupadd -r appuser && \
#     useradd -r -g appuser appuser
#
# USER appuser

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci

# Copy application files
COPY . .

# Copy and set permissions for scripts
COPY build.sh watch.sh ./
RUN chmod +x build.sh watch.sh

CMD ["./watch.sh"]
