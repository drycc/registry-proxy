FROM registry.drycc.cc/drycc/base:bullseye

ENV DRYCC_UID=1001 \
  DRYCC_GID=1001 \
  DRYCC_HOME_DIR=/opt/drycc/nginx \
  NGINX_VERSION="1.23.1"

RUN groupadd drycc --gid ${DRYCC_GID} \
  && useradd drycc -u ${DRYCC_UID} -g ${DRYCC_GID} -s /bin/bash -m -d ${DRYCC_HOME_DIR} \
  && install-packages curl \
  && install-stack nginx ${NGINX_VERSION} \
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
  && mkdir -p /usr/share/man/man{1..8}

COPY bin /bin/
COPY etc/nginx/ ${DRYCC_HOME_DIR}
RUN chown -R ${DRYCC_UID}:${DRYCC_GID} ${DRYCC_HOME_DIR}

USER ${DRYCC_UID}
WORKDIR ${DRYCC_HOME_DIR}
CMD ["/bin/boot"]
