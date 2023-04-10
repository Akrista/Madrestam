FROM jlesage/baseimage-gui:debian-11-v4.4

ENV APP_NAME="Lindo"
ENV DARK_MODE=1

# All this gets executed on /tmp
RUN set -x && \
    dir /config && \
    dpkg --add-architecture i386 && \
    echo "========== Updating ==========" && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
    sudo \
    xterm \
    apt-utils \
    ca-certificates \
    curl

RUN echo "========== Setup sudoers ==========" && \
    echo "app    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN echo "========== Install Dependencies ==========" && \
    apt-get install -y --no-install-recommends \
    libnss3 \
    libatk-bridge2.0-0 \
    libcups2 \
    libgtk-3-0 \
    libgbm1 \
    libasound2 \
    libatk1.0-0

RUN echo "========== Install Lindo Emulator ==========" && \
    mkdir -p /lindo && \
    curl -# -L -o /lindo/lindo-3.0.0-rc.12.tar.gz https://github.com/prixe/lindo/releases/download/v3.0.0-rc.12/lindo-3.0.0-rc.12.tar.gz && \
    tar -xzf /lindo/lindo-3.0.0-rc.12.tar.gz -C /usr/local/bin --strip-components=1

RUN echo "========== Clean up ==========" && \
    rm -r /lindo && \
    rm /var/lib/dpkg/statoverride && \
    apt-get autoremove -y && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*

COPY rootfs/ /

# Metadata.
LABEL \
    org.label-schema.name="madrestam-lindo" \
    org.label-schema.description="Docker container for playing Lindo Emulator" \
    org.label-schema.version="${DOCKER_IMAGE_VERSION:-unknown}" \
    org.label-schema.vcs-url="https://github.com/akrista/madrestam" \
    org.label-schema.schema-version="1.0"