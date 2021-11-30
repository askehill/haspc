ARG BUILD_FROM
FROM homeassistant/armv7-base-debian

RUN ["useradd","-U", "spc"]

ENV LANG C.UTF-8

ADD http://192.168.1.39/current/ /
RUN ["chmod", "a+x", "/opt/spc-web-gateway/spc-web-gateway"]
RUN ["chown", "-R" , "spc:spc", "/opt/spc-web-gateway"]

USER spc
CMD [ "/opt/spc-web-gateway/spc-web-gateway", "--help" ]