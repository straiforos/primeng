# Use Node 18 as base image with multi-platform support
FROM --platform=$BUILDPLATFORM node:18-alpine

# Set working directory
WORKDIR /app

# Install Python and build dependencies
RUN apk add --no-cache python3 make g++ gcc py3-pip py3-setuptools

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Build the SSR application
RUN npm run build:ssr

# Expose port 4000 (typical for SSR apps)
EXPOSE 4000

# Start the SSR server
CMD ["npm", "run", "serve:ssr"]
