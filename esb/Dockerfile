FROM debian:latest

RUN apt update \
    && apt install -y \
            locales \
            curl \
            wget \
    && locale-gen ru_RU.UTF-8

#INSTALL JAVA

# ARG OPENJDK_VERSION=17
# RUN mkdir -p /etc/apt/keyrings \
#     && wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc \
#     && echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list \
#     && apt update \
#     && apt install -y temurin-${OPENJDK_VERSION}-jdk \
#     && localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8
#

ARG JDKFX_VERSION=17.0.16
RUN wget https://cdn.azul.com/zulu/bin/zulu17.60.17-ca-fx-jdk${JDKFX_VERSION}-linux_amd64.deb \
    && mv ./zulu17.60.17-ca-fx-jdk${JDKFX_VERSION}-linux_amd64.deb /tmp/zulu_jdk_fx.deb \
    && apt install -y /tmp/zulu_jdk_fx.deb

#INSTALL ESB
ENV LANG="ru_RU.UTF-8"
ENV LC_ALL="ru_RU.UTF-8"


#INSTALL OSCRIPT
ARG OVM_REPOSITORY_OWNER=oscript-library
ARG OVM_VERSION=v1.6.2
ARG ONESCRIPT_VERSION=stable
ARG ONESCRIPT_PACKAGES="yard"

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        mono-runtime \
        ca-certificates-mono \
        libmono-i18n4.0-all \
        libmono-system-runtime-serialization4.0-cil
    
RUN wget https://github.com/${OVM_REPOSITORY_OWNER}/ovm/releases/download/${OVM_VERSION}/ovm.exe \
  && mv ovm.exe /usr/local/bin/ \
  && echo 'mono /usr/local/bin/ovm.exe "$@"' | tee /usr/local/bin/ovm \
  && chmod +x /usr/local/bin/ovm \
  && ovm use --install ${ONESCRIPT_VERSION}
  
ENV OSCRIPTBIN=/root/.local/share/ovm/current/bin
ENV PATH="$OSCRIPTBIN:$PATH"

RUN opm install opm \
  && opm update --all \
  && opm install ${ONESCRIPT_PACKAGES} 

    # install postgresql
    #ARG POSTGRESQL_VERSION=15
    # && apt install -y postgresql-common \
    # && install -d /usr/share/postgresql-common/pgdg \
    # && curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc \
    # && . /etc/os-release \
    # && sh -c "echo 'deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $VERSION_CODENAME-pgdg main' > /etc/apt/sources.list.d/pgdg.list" \
    # && apt update \
    # && apt -y install postgresql-${POSTGRESQL_VERSION}


#COPY ./esb /tmp/esb

#RUN chmod +x /tmp/esb/1ce-installer-cli install  --ignore-hardware-checks --ignore-signature-warnings

