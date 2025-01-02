# Hugo
This Docker stack allows you to run a static website using Hugo, a fast static site generator. The stack builds and serves your Hugo site using Docker, with an optional integration with Nginx for reverse proxy configuration.

## Prerequisites
 - Docker installed on your server.
 - Basic knowledge of Hugo and static site generation.
 - Optional: Nginx or other reverse proxy service (for production setup).

## Installation

1. **Clone the git repository:**
```bash
    git clone  https://github.com/NotBeCursed/Hugo.git
    cd hugo
```
2. **Configuration:**
 - **HUGO_BASEURL** : Set this environment variable in the `docker-compose.yml` to specify the base URL for your Hugo site. The default is `http://localhost:1313`.
 - **Nginx Proxy Manager (Optional)**: If you plan to use Nginx Proxy Manager (NPM) for SSL and reverse proxying, ensure that :
    - You have configured a reverse proxy in NPM pointing to the Hugo container's IP address or `localhost` on port 1313.

4.** Run the Docker container:**
Once everything is configured, start the Hugo site by running the following command:
```bash
    docker compose up -d
```

5. **Access the Hugo Site:**
 - By default, the Hugo site will be available on port 1313. You can access it by visiting: `http://localhost:1313`.
 - If you're using an external network or reverse proxy, you might need to set up a proxy to access it via your desired domain.

## Troubleshooting
 -  **Container fails to start**: Check the logs to diagnose issues:
 ```bash
    docker-compose logs hugo
 ```
- **Permissions issues**: Ensure that the `volumes-hugo-blogpost` volume has the appropriate permissions for the Hugo container.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.