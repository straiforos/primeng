# PrimeNG 16.4.2 Docker Server Configuration

This Dockerfile configures a container to run the PrimeNG v16.4.2 documentation server with server-side rendering (SSR). The configuration supports both ARM64 (Apple Silicon) and AMD64 (Intel/AMD) architectures.

## Container Configuration
- Base image: `node:18-alpine`
- Serves PrimeNG documentation and demos
- Version: 16.4.2
- Port: 4000
- Architectures: ARM64, AMD64

## Build & Run Process
1. Uses Node.js 18 with Alpine Linux for minimal image size
2. Installs dependencies for PrimeNG v16.4.2
3. Builds SSR application
4. Runs server via `npm run serve:ssr`

## Quick Start

### Single Architecture Build
1. Build the Docker image:
   ```bash
   docker build -t primeng-docs .
   ```

2. Run the container:
   ```bash
   docker run -p 4000:4000 primeng-docs
   ```

### Multi-Architecture Build
1. Create and use a new builder with multi-architecture support:
   ```bash
   docker buildx create --use
   ```

2. Build and push for multiple architectures:
   ```bash
   docker buildx build --platform linux/amd64,linux/arm64 -t YOUR_USERNAME/primeng-docs:16.4.2 --push .
   ```

3. Access the documentation:
   - Open your browser and navigate to `http://localhost:4000`
   - The SSR-enabled PrimeNG documentation will be available

## Publishing to Docker Hub
1. Login to Docker Hub:
   ```bash
   docker login
   ```

2. Build and push multi-architecture image:
   ```bash
   docker buildx build --platform linux/amd64,linux/arm64 \
     -t YOUR_USERNAME/primeng-docs:16.4.2 \
     --push .
   ```

After pushing, your image will be available at `docker.io/YOUR_USERNAME/primeng-docs:16.4.2` and will work on both ARM64 and AMD64 architectures.

## Architecture-Specific Builds
If you need to build for a specific architecture:

- For ARM64 (Apple Silicon):
  ```bash
  docker build --platform linux/arm64 -t primeng-docs:arm64 .
  ```

- For AMD64 (Intel/AMD):
  ```bash
  docker build --platform linux/amd64 -t primeng-docs:amd64 .
  ```


