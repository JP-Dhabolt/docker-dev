FROM debian:bullseye

ARG TARGET_GO_VERSION=1.15.8
ARG INSTALL_ZSH="false"
ARG UPGRADE_PACKAGES="true"

# Install needed packages and setup non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
COPY build-files/common-debian.sh /tmp/library-scripts/
RUN bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# Install Go tools
ENV GO111MODULE=auto
COPY build-files/go-debian.sh /tmp/library-scripts/
RUN bash /tmp/library-scripts/go-debian.sh "${TARGET_GO_VERSION}" "/usr/local/go" "/go" "${USERNAME}" "false" \
    && apt-get clean -y && rm -rf /tmp/library-scripts

# [Option] Install Node.js
ARG INSTALL_NODE="false"
ARG NODE_VERSION="none"
ENV NVM_DIR=/usr/local/share/nvm
ENV NVM_SYMLINK_CURRENT=true \
    PATH=${NVM_DIR}/current/bin:${PATH}
COPY build-files/node-debian.sh /tmp/library-scripts/
RUN if [ "$INSTALL_NODE" = "true" ]; then bash /tmp/library-scripts/node-debian.sh "${NVM_DIR}" "${NODE_VERSION}" "${USERNAME}"; fi \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# Install OpenGL libraries. Display assumes running vnc sidecar image.
ENV DISPLAY="vnc:0.0"
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends libglfw3-dev libxcursor-dev libxinerama-dev libxi-dev libxrandr-dev libxxf86vm-dev mesa-utils \
    && apt-get -y clean
