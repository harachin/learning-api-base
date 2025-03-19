FROM debian:12.10

ARG USER=maintainer
ARG UID=1001
ARG GID=1001
ARG HOMEDIR=/home/${USER}

# Set maintainer user.
RUN groupadd -g ${GID} ${USER} && \
    useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USER}

# Install required packages
RUN apt-get update && apt-get install --no-install-recommends -y \
    git \
    curl \
    vim \
    less \
    sudo

# Set timezone to Asia/Tokyo
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Set default shell
RUN chsh -s /bin/bash ${USER}

# Copy dotfiles
COPY ./dotfiles/ ${HOMEDIR}/

# Change owner
RUN chown -R ${USER}:${USER} ${HOMEDIR}

USER ${USER}

EXPOSE 3000
