#checkov:skip=CKV_DOCKER_2: HEALTHCHECK not required - This is a utility container

FROM docker.io/alpine:3.22@sha256:55ae5d250caebc548793f321534bc6a8ef1d116f334f18f4ada1b2daad3251b2

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
