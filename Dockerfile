FROM python:latest

MAINTAINER Ralf Schneider <ralf@hr-interactive.de>

# requirements: plugins to install {all|base}
ENV SMARTHOMENG_REQUIREMENTS "all"


RUN apt-get update -qq \
    && apt-get install -y \
        git \
        apt


RUN adduser smarthome --disabled-password --gecos "First Last,RoomNumber,WorkPhone,HomePhone" \
    && usermod -aG www-data,sudo smarthome

RUN cd /usr/local \
    && git clone --recursive git://github.com/smarthomeNG/smarthome.git --single-branch \
    && chown -R smarthome:smarthome /usr/local/smarthome

WORKDIR /usr/local/smarthome

RUN pip install -r requirements/${SMARTHOMENG_REQUIREMENTS}.txt

# Runtime data
VOLUME /usr/local/smarthome/var

### telnet port for CLI plugin, websocket to smartVISU, webserver of smarthomeNG backend plugin
EXPOSE 2323 2424 8383


USER smarthome

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
### start SmartHomeNG in silent mode, not verbose
CMD ["--start"]
