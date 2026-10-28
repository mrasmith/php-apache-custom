# Custom PHP Apache

A custom PHP 8.3 Apache Docker image with PHP extensions, Node.js, Composer, and media and document-processing utilities.

## Docker Image

**GitHub Container Registry:** `ghcr.io/mrasmith/php-apache-custom:latest`

Pull the image:

```bash
docker pull ghcr.io/mrasmith/php-apache-custom:latest
```

## Installed Versions

| Component | Installed version |
|---|---|
| PHP | <!-- PHP_VERSION -->Pending first build<!-- /PHP_VERSION --> |
| Node.js | <!-- NODE_VERSION -->Pending first build<!-- /NODE_VERSION --> |
| Composer | <!-- COMPOSER_VERSION -->Pending first build<!-- /COMPOSER_VERSION --> |
| Last successful image build | <!-- BUILD_DATE -->Pending first build<!-- /BUILD_DATE --> |

These details are updated automatically after each successful build.

## Included Software

**PHP extensions**
- MySQLi
- PDO MySQL
- GD with JPEG and FreeType support
- EXIF
- Calendar
- ZIP
- Imagick

**Development tools**
- Apache
- Composer 2
- Node.js 24
- Git
- cURL and Wget
- ZIP and Unzip
- Brotli

**Media and document processing**
- FFmpeg
- ImageMagick
- Poppler utilities
- Tesseract OCR
- Pandoc

**Apache modules**
- Rewrite
- Headers
- Expires

## Example Docker Compose

```yaml
services:
  php-apache:
    image: ghcr.io/mrasmith/php-apache-custom:latest
    container_name: php-apache-custom
    restart: unless-stopped
    ports:
      - "8080:80"
    volumes:
      - ./html:/var/www/html
```

Place your PHP application files in the local `html` directory. They will be accessible through Apache on port 8080.

## Automated Builds

GitHub Actions builds and publishes the image:
- When changes are pushed to `main`.
- Weekly on Monday at 05:43 UTC.
- When manually triggered.

The workflow publishes the `latest` image tag and updates this README with the installed software versions.

## Updating Your Container

```bash
docker compose pull
docker compose up -d
```

Pulling a new image does not automatically replace an already-running container; `docker compose up -d` recreates it when necessary.

## Source

Repository: https://github.com/mrasmith/php-apache-custom
