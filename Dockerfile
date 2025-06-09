ARG TAG
FROM codercom/code-server:${TAG:-latest}

USER root
RUN apt-get update && apt-get upgrade --no-install-recommends --yes && apt-get install --no-install-recommends --yes \
    default-jre graphviz

USER 1000

RUN code-server --install-extension vadimcn.vscode-lldb && \
    code-server --install-extension asciidoctor.asciidoctor-vscode && \
    code-server --install-extension MermaidChart.vscode-mermaid-chart && \
    code-server --install-extension jebbs.plantuml
