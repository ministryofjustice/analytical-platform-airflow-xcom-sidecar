#checkov:skip=CKV_DOCKER_2: HEALTHCHECK not required - This is a utility container

FROM docker.io/alpine:3.23@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11

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
