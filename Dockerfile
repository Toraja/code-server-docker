ARG TAG
FROM codercom/code-server:${TAG:-latest}

USER root
RUN apt-get update && apt-get upgrade --no-install-recommends --yes && apt-get install --no-install-recommends --yes \
    default-jre graphviz

USER 1000
