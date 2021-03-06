FROM ubuntu

RUN apt-get update

RUN apt-get install -yq curl apt-transport-https ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_6.x |  bash
RUN apt-get install -y nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g cnpm yarn --registry=https://registry.npm.taobao.org
RUN cnpm install -g grunt-cli
RUN apt-get install --force-yes -yq \
    wget \
    build-essential \
    libcurl4-gnutls-dev \
    libglib2.0-dev \
    libgdk-pixbuf2.0-dev \
    libgtkglext1-dev \
    libatk1.0-dev \
    libcairo2-dev \
    libxml2-dev \
    libxss-dev \
    libgconf2-dev \
    default-jre \
    qt5-qmake \
    qt5-default  \
    p7zip-full \
    git \
    subversion





WORKDIR /workspace

RUN	git clone --recursive --depth=1 https://github.com/ONLYOFFICE/DocumentServer.git /workspace


RUN cd /workspace/core/Common/3dParty && ./make.sh



# COPY docker-entrypoint.sh /usr/local/bin
# ENTRYPOINT ["docker-entrypoint.sh"]

# EXPOSE 2368
# CMD ["node", "index.js"]
CMD ["echo", "Hello"]
