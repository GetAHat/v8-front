FROM debian:bullseye

RUN echo "ru_RU.UTF-8" > /etc/locale.gen
RUN mkdir -p /home/v8
# RUN apt-add-repository non-free
RUN echo "deb http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian bullseye contrib non-free" >> /etc/apt/sources.list
RUN apt update
RUN apt install debconf locales && dpkg-reconfigure locales
RUN apt install -y libwebkitgtk-3.0-0 unixodbc xauth openssl ca-certificates ttf-mscorefonts-installer

ENV XAUTHORITY=~/.Xauthority

COPY ./v8-thinclient/* /home/v8
RUN tar -xvf /home/v8/*.tar.gz -C /home/v8/
#RUN xhost + local:

RUN apt install -y /home/v8/*.deb
RUN mkdir -p /opt/1C/v8.3/x86_64/conf
RUN echo SystemLanguage=RU > /opt/1C/v8.3/x86_64/conf/conf.cfg

CMD ["/opt/1C/v8.3/x86_64/1cv8c"]