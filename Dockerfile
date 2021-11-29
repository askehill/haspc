ARG BUILD_FROM
#FROM $BUILD_FROM
FROM ubuntu
ENV LANG C.UTF-8
#RUN apk add --no-cache libc6-compat gcompat
RUN apt-get update
RUN apt-get install -y openssl

ADD http://192.168.1.39/spc-web-gateway-1.5/spc-web-gateway /opt/spc-web-gateway/
RUN chmod a+x /opt/spc-web-gateway/spc-web-gateway

CMD [ "/opt/spc-web-gateway/spc-web-gateway --help" ]