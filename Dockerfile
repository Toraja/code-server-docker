ARG TAG=latest
FROM codercom/code-server:${TAG}

ARG UID=1000
ARG GID=1000

USER root
RUN apt-get update && apt-get upgrade --no-install-recommends --yes && apt-get install --no-install-recommends --yes \
    default-jre graphviz

# Must be 1000 or fails to install extensions due to permission issues
USER 1000

ARG COPILOT_CHAT_VERSION=latest
RUN curl --fail --silent --show-error --location \
    "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/GitHub/vsextensions/copilot-chat/${COPILOT_CHAT_VERSION}/vspackage" | \
    gunzip - --stdout > copilot-chat.vsix && \
    code-server --install-extension ./copilot-chat.vsix && \
    code-server --install-extension vadimcn.vscode-lldb && \
    code-server --install-extension asciidoctor.asciidoctor-vscode && \
    code-server --install-extension MermaidChart.vscode-mermaid-chart && \
    code-server --install-extension jebbs.plantuml && \
    rm copilot-chat.vsix

# The directory is created when code-server command runs above, so ownership needs to be changed after that
RUN sudo chown --recursive ${UID}:${GID} /home/coder/.local/share/code-server
VOLUME /home/coder/.local/share/code-server
