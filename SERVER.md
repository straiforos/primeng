# PrimeNG 16.4.2 Docker Server Configuration

This Dockerfile configures a container to run the PrimeNG v16.4.2 documentation server with server-side rendering (SSR).

## Container Configuration
- Base image: `node:18-alpine`
- Serves PrimeNG documentation and demos
- Version: 16.4.2
- Port: 4000

## Build & Run Process
1. Uses Node.js 18 with Alpine Linux for minimal image size
2. Installs dependencies for PrimeNG v16.4.2
3. Builds SSR application
4. Runs server via `npm run serve:ssr`

## Quick Start
1. Build the Docker image:
   ```bash
   docker build -t primeng-docs .
   ```

2. Run the container:
   ```bash
   docker run -p 4000:4000 primeng-docs
   ```

3. Access the documentation:
   - Open your browser and navigate to `http://localhost:4000`
   - The SSR-enabled PrimeNG documentation will be available


