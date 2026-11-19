#checkov:skip=CKV_DOCKER_2: HEALTHCHECK not required - This is a utility container

FROM docker.io/alpine:3.24.4@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf

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
apk add --no-cache libcrypto3~3.5.9 libssl3~3.5.9
adduser -D -u "${CONTAINER_UID}" -g "${CONTAINER_GID}" "${CONTAINER_USER}"
EOF

USER ${CONTAINER_UID}
