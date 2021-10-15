# Docker Apache PHP 8

A Docker image providing a minimal LAP stack &mdash; Alpine, Apache and PHP 8.

## Usage

The document root of Apache is `/app`. Therefore the quickest way to run this image is:

    docker run -dp 80:80 -v "/your/path:/app" mdahdm/apache-php8

You can now place you app file in `/your/path`.