FROM debian:latest

RUN apt update \
    && apt install -y \
            locales 

ENV DISTR_DIR=/tmp/pg_distr
ENV DEPS_DIR=$DISTR_DIR/pg_deps

COPY ./pg_distr $DISTR_DIR
COPY ./pg_deps  $DEPS_DIR
COPY ./install_deps.sh  $DISTR_DIR/install_deps.sh 

RUN chmod +x $DISTR_DIR/install_deps.sh \
    && $DISTR_DIR/install_deps.sh  
