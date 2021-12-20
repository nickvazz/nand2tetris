FROM ubuntu:18.04
# FROM openjdk:16-alpine3.13

RUN apt-get update \
  && apt-get upgrade -y     \
  && apt-get install -y build-essential curl git locales procps sudo tmux tree vim wget     \
  && locale-gen en_US.UTF-8   \
  && apt-get autoremove -y     \
  && apt-get clean -y     \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install default-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY tools /nand2tetris/tools
RUN chmod +x /nand2tetris/tools/*.sh
VOLUME /projects


WORKDIR /nand2tetris

CMD ["/bin/bash"]
