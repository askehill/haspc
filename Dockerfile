ARG BUILD_FROM
#FROM $BUILD_FROM
FROM homeassistant/amd64-base-ubuntu

RUN ["useradd", "spc"]

ENV LANG C.UTF-8



ADD http://192.168.1.39/spc-web-gateway-1.5/spc-web-gateway /opt/spc-web-gateway/
COPY www/ /opt/spc-web-gateway/www
COPY config.xml /opt/spc-web-gateway
RUN ["chmod", "a+x", "/opt/spc-web-gateway/spc-web-gateway"]
RUN ["chown", "-R" , "spc:spc", "/opt/spc-web-gateway"]

USER spc

CMD [ "/opt/spc-web-gateway/spc-web-gateway --help" ]
