FROM mcr.microsoft.com/devcontainers/base:jammy

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Linux に Azure CLI をインストールする
# https://learn.microsoft.com/ja-jp/cli/azure/install-azure-cli-linux?pivots=apt
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Azure Functions Core Tools のインストール
# https://learn.microsoft.com/ja-jp/azure/azure-functions/functions-run-local?tabs=linux%2Cisolated-process%2Cnode-v4%2Cpython-v2%2Chttp-trigger%2Ccontainer-apps&pivots=programming-language-csharp#install-the-azure-functions-core-tools
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
    && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs 2>/dev/null)-prod $(lsb_release -cs 2>/dev/null) main" > /etc/apt/sources.list.d/dotnetdev.list'

# terraformインストール
# https://developer.hashicorp.com/terraform/install#linux
RUN wget -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update && apt-get install -y terraform \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# uvインストール
# https://zenn.dev/watanko/articles/8400df75e4aab5
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

