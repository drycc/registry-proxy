FROM docker.io/drycc/base:bullseye

RUN adduser --system \
   --shell /bin/bash \
   --disabled-password \
   --home /opt/drycc/nginx \
   --group \
   nginx

ENV NGINX_VERSION="1.18.0"

RUN install-packages curl \
  && install-stack nginx $NGINX_VERSION \
  && rm -rf \
      /usr/share/doc \
      /usr/share/man \
      /usr/share/info \
      /usr/share/locale \
      /var/lib/apt/lists/* \
      /var/log/* \
      /var/cache/debconf/* \
      /etc/systemd \
      /lib/lsb \
      /lib/udev \
      /usr/lib/`echo $(uname -m)`-linux-gnu/gconv/IBM* \
      /usr/lib/`echo $(uname -m)`-linux-gnu/gconv/EBC* \
  && mkdir -p /usr/share/man/man{1..8} \
COPY bin /bin/
COPY etc/nginx/ /opt/drycc/nginx
RUN chown -R nginx:nginx /opt/drycc/nginx

USER nginx
CMD ["/bin/boot"]
