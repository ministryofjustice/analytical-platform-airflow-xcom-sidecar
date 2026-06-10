#checkov:skip=CKV_DOCKER_2: HEALTHCHECK not required - This is a utility container

FROM docker.io/alpine:3.24@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4

LABEL org.opencontainers.image.vendor="Ministry of Justice" \
      org.opencontainers.image.authors="Analytical Platform (analytical-platform@digital.justice.gov.uk)" \
      org.opencontainers.image.title="Airflow XCom Sidecar" \
      org.opencontainers.image.description="Airflow XCom Sidecar image for Analytical Platform" \
      org.opencontainers.image.url="https://github.com/ministryofjustice/analytical-platform-airflow-xcom-sidecar"

ENV CONTAINER_USER="analyticalplatform" \
    CONTAINER_UID="1000" \
    CONTAINER_GROUP="analyticalplatform" \
    CONTAINER_GID="1000"

RUN <<EOF
adduser -D -u "${CONTAINER_UID}" -g "${CONTAINER_GID}" "${CONTAINER_USER}"
EOF

USER ${CONTAINER_UID}
