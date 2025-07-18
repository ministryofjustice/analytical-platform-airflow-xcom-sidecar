# Analytical Platform Airflow XCom Sidecar

[![Ministry of Justice Repository Compliance Badge](https://github-community.service.justice.gov.uk/repository-standards/api/analytical-platform-airflow-xcom-sidecar/badge)](https://github-community.service.justice.gov.uk/repository-standards/analytical-platform-airflow-xcom-sidecar)

[![Open in Dev Container](https://raw.githubusercontent.com/ministryofjustice/.devcontainer/refs/heads/main/contrib/badge.svg)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/ministryofjustice/analytical-platform-airflow-xcom-sidecar)

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/ministryofjustice/analytical-platform-airflow-xcom-sidecar)

This repository contains the Airflow XCom Sidecar image for use on the Analytical Platform.

## Running Locally

### Build

```bash
make build
```

### Test

```bash
make test
```

## Managing Software Versions

### Alpine

Dependabot is configured to do this in [`.github/dependabot.yml`](.github/dependabot.yml), but if you need to get the digest, do the following

```bash
docker pull --platform linux/amd64 docker.io/alpine:3.22

docker image inspect --format='{{ index .RepoDigests 0 }}' docker.io/alpine:3.22
```

## Deploying

After a release of this image has been created, you need to update `PodDefaults.SIDECAR_CONTAINER.image` in <https://github.com/ministryofjustice/analytical-platform-airflow/blob/main/airflow/analytical_platform/standard_operator.py>
