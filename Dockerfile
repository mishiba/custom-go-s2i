FROM golang:1.12

LABEL maintainer="Your Name <your@email.com>"

LABEL io.k8s.description="A Go S2I builder image" \
      io.k8s.display-name="Go S2I builder image" \
      io.openshift.expose-services="8080:http" \
      io.openshift.s2i.scripts-ulr="image:///usr/libexec/s2i" \
      io.openshift.tags="builder, go, golang"

ENV APP_ROOT /opt/app-root

COPY ./s2i/bin/ /usr/libexec/s2i

RUN mkdir -p ${APP_ROOT} && \
    chown -R 1001:1001 ${APP_ROOT} && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT}

USER 1001

EXPOSE 8080

WORKDIR ${APP_ROOT}}

CMD ["/usr/libexec/s2i/usage"]