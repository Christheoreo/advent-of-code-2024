# Base image
FROM php:8.2-cli

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    curl \
    libzip-dev \
    && docker-php-ext-install zip

# Install Xdebug for debugging
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Setup user for VS Code compatibility
ARG USERNAME=devuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get clean

# Set working directory
WORKDIR /app

# Switch to non-root user
USER $USERNAME

# Expose port for debugging
EXPOSE 9003

# Command to keep the container running
CMD ["sleep", "infinity"]
