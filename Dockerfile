#checkov:skip=CKV_DOCKER_2: HEALTHCHECK not required - This is a utility container

FROM docker.io/alpine:3.24.3@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a

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
