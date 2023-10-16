FROM mcr.microsoft.com/devcontainers/base:bookworm

# Set username
ARG USERNAME=sayantan

# Set environment variables for non-interactive apt installations
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    python3-openssl \
    git

# Install pyenv
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

# Add pyenv initialization to bashrc for simplicity
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'if command -v pyenv 1>/dev/null 2>&1; then' >> ~/.bashrc && \
    echo '  eval "$(pyenv init --path)"' >> ~/.bashrc && \
    echo 'fi' >> ~/.bashrc

# Install Python using pyenv
RUN /bin/bash -c "source ~/.bashrc && pyenv install 3.12 && pyenv global 3.12"

# Install Oh-My-Posh
RUN sh -c "$(curl -fsSL https://get.ohmyposh.dev/install.sh)"

# oh-my-posh configuration
COPY ./config/minimal.json /home/${USERNAME}/.oh-my-posh/themes/

# Initialize oh-my-posh
RUN echo 'source ~/.oh-my-posh/oh-my-posh.sh' >> ~/.bashrc

# dev container specific settings
# RUN mkdir -p /var/devcontainer
# RUN touch /var/devcontainer/.patchEtcEnvironmentMarker
