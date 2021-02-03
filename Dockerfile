# s2i-jdk8
FROM harbor.apps.ocp.nmandadhi.com/library/ubi:1.0

LABEL maintainer="Naveen Mandadhi <nvnmandadhi@gmail.com>" \
      io.openshift.s2i.scripts-url="image:///opt/app-root/s2i/bin"

ENV BUILDER_VERSION 1.0

USER root

COPY s2i /opt/app-root/s2i

RUN PACKAGES="java-1.8.0-openjdk-devel" && \
    dnf -y install $PACKAGES && \
    dnf clean all

ENV JAVA_HOME=/etc/alternatives/jre

RUN mkdir -p /opt/app-root/src && \
    chown -R 1001:1001 /opt/app-root/ && \
    chmod -R 755 /opt/app-root/

USER 1001

EXPOSE 8080

CMD ["/opt/app-root/s2i/bin/usage"]
