FROM jlesage/baseimage-gui:debian-11

ENV APP_NAME="Madrestam"
# APPDIR is the directory where the Ankama Launcher is downloaded and extracted
ENV APPDIR="/akl/squashfs-root/"

# All this gets executed on /tmp

RUN set -x && \
    dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
    sudo \
    xterm \
    apt-utils \
    curl && \
    echo "========== Setup sudoers ==========" && \
    echo "app    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "========== Install Dependencies ==========" && \
    apt-get install -y --no-install-recommends \
    libnss3 \
    libatk-bridge2.0-0 \
    libcups2 \
    libgtk-3-0 \
    libgbm1 \
    libasound2 \
    libatk1.0-0 && \
    # ==== We may not need this, this is only for steam ==== #
    # gnupg \
    # xz-utils \
    # libc6-i386 \
    # libgl1:i386 \
    # libxtst6:i386 \
    # libxrandr2:i386 \
    # libglib2.0-0:i386 \
    # libgtk2.0-0:i386 \
    # libpulse0:i386 \
    # libva2:i386 \
    # libbz2-1.0:i386 \
    # libvdpau1:i386 \
    # libva-x11-2:i386 \
    # libcurl4-gnutls-dev:i386 \
    # libopenal1:i386 \
    # libsm6:i386 \
    # libice6:i386 \
    # libasound2-plugins:i386 \
    # libsdl2-image-2.0-0:i386 \
    # wine \
    # dbus \
    # dbus-x11 \
    # file \
    # pulseaudio \
    # pciutils \
    # zenity && \
    mkdir -p /akl && \
    pwd && \
    echo $APPDIR && \
    curl -# -L -o /akl/Ankama_Launcher-Setup-x86_64.AppImage https://launcher.cdn.ankama.com/installers/production/Ankama%20Launcher-Setup-x86_64.AppImage && \
    chmod +x /akl/Ankama_Launcher-Setup-x86_64.AppImage && \
    cd /akl && \
    /akl/Ankama_Launcher-Setup-x86_64.AppImage --appimage-extract && \
    dir /akl && \
    rm /akl/Ankama_Launcher-Setup-x86_64.AppImage && \
    # cd /akl/squashfs-root && \
    # dir /akl/squashfs-root && \
    # sudo -u app /akl/squashfs-root/AppRun --install && \
    # dir ~/.local/share/applications && \
    echo "========== Clean up ==========" && \
    rm /var/lib/dpkg/statoverride && \
    apt-get autoremove -y && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*

COPY rootfs/ /

# Metadata.
LABEL \
    org.label-schema.name="madrestam" \
    org.label-schema.description="Docker container for playing Ankama Games" \
    org.label-schema.version="${DOCKER_IMAGE_VERSION:-unknown}" \
    org.label-schema.vcs-url="https://github.com/akrista/madrestam" \
    org.label-schema.schema-version="1.0"