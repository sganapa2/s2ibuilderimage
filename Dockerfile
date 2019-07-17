FROM node:10.15.3 AS builder

MAINTAINER sganapa@parkar.consulting

COPY .s2i/bin /usr/local/s2i

LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i

RUN chown -R 1001:0 /opt/app-root
RUN chown -R 1001:0 /usr/src/clinicaltrial_UX

USER 1001

CMD ["echo", "This is output text from Dockerfile written by Santosh Ganapa"]

FROM nginx:1.15.8-alpine
RUN mkdir -p /usr/share/nginx/html

RUN chown -R 1001:0 /usr/share/nginx/html

EXPOSE 8080
