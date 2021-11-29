ARG BUILD_FROM
FROM $BUILD_FROM

RUN ["useradd","-U", "spc"]

ENV LANG C.UTF-8

ADD http://192.168.1.39/spc-web-gateway /opt/spc-web-gateway/
COPY spc-web-gateway /opt/spc-web-gateway/
COPY config.xml /opt/spc-web-gateway
RUN ["chmod", "a+x", "/opt/spc-web-gateway/spc-web-gateway"]
RUN ["chown", "-R" , "spc:spc", "/opt/spc-web-gateway"]

USER spc

CMD [ "/opt/spc-web-gateway/spc-web-gateway", "--help" ]