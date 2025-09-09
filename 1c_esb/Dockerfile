FROM debian:latest

RUN apt update \
    && apt install -y \
            locales \
            yq

COPY ./esb /tmp/esb
COPY ./entrypoint.sh /tmp/entrypoint.sh

ENV LANG="ru_RU.UTF-8"
ENV LC_ALL="ru_RU.UTF-8"

RUN apt update \
    && apt install -y \
            locales \
            yq \
    && sed -i 's/^# *\(ru_RU.UTF-8\)/\1/' /etc/locale.gen \
    && locale-gen \
    && echo "export LC_ALL=ru_RU.UTF-8" >> ~/.bashrc \
    && echo "export LANG=ru_RU.UTF-8" >> ~/.bashrc \
    && echo "export LANGUAGE=ru_RU.UTF-8" >> ~/.bashrc \
    && /tmp/esb/1ce-installer-cli install --disable-service-creation \
    && chmod +x /tmp/entrypoint.sh
    
ENTRYPOINT ["/tmp/entrypoint.sh"]
