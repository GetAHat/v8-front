FROM debian:bullseye

RUN groupadd -g 1000 v8group\
    && useradd -u 1000 -mG v8group v8user

RUN mkdir -p /packages
RUN echo "deb http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list \
    && echo "deb http://deb.debian.org/debian bullseye contrib non-free" >> /etc/apt/sources.list \
    && apt update \
    && apt install -y libwebkitgtk-3.0-0 unixodbc xauth openssl ca-certificates ttf-mscorefonts-installer locales

ENV LC_ALL=ru_RU.UTF-8
RUN echo "ru_RU.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen

ENV XAUTHORITY=~/.Xauthority


COPY ./v8-thinclient/* /packages
RUN tar -xvf /packages/*.tar.gz -C /packages/
#RUN xhost + local:

RUN apt install -y /packages/*.deb
RUN rm -rf /packages
RUN mkdir -p /opt/1C/v8.3/x86_64/conf
RUN echo SystemLanguage=RU > /opt/1C/v8.3/x86_64/conf/conf.cfg

CMD ["/opt/1C/v8.3/x86_64/1cv8c"]