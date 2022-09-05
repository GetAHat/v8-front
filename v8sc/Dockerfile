FROM debian:bullseye

RUN groupadd -g 1000 v8group\
    && useradd -u 1000 -mG v8group v8user

RUN mkdir -p /packages
RUN echo "deb http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list \
    && echo "deb http://deb.debian.org/debian bullseye contrib non-free" >> /etc/apt/sources.list \
    && apt update \
    && apt install -y libwebkitgtk-3.0-0 unixodbc xauth openssl ca-certificates ttf-mscorefonts-installer locales iputils-ping

ENV XAUTHORITY=~/.Xauthority
ENV LC_ALL=ru_RU.UTF-8
RUN echo "ru_RU.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen




COPY ./v8-client/*.tar.gz /packages
COPY ./v8-client/nethasp.ini /etc

RUN tar -xvf /packages/deb64_*.tar.gz -C /packages/ \
    && apt install -y /packages/*.deb \
    && rm /packages/*.deb

RUN tar -xvf /packages/client_*.tar.gz -C /packages/ \
    && rm /packages/*-thin*.deb \
    && apt install -y /packages/*.deb \
    && rm -rf /packages


#RUN apt install -y /packages/*.deb
RUN rm -rf /packages
RUN mkdir -p /opt/1cv8/x86_64/conf
RUN echo SystemLanguage=RU > /opt/1cv8/x86_64/conf/conf.cfg
RUN mkdir -p $HOME/v8bases \
    && mkdir -p $HOME/shared

CMD /opt/1cv8/x86_64/$v8ver/1cv8