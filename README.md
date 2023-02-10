# GCP Cloudrun w/ Postgres Infrastructure

---

IaC for GCP Cloudrun container with postgres instance.

## Requires

- [asdf vm](https://asdf-vm.com)

## Install required dependencies

Required dependencies are found in `.tool-versions` and read by asdf.

```bash
### FIRST RUN
# Add required gcloud components
sh ./scripts/setup-gcp-cloud-components.sh

#  Install as needed based on .tool-versions
curl -sL https://raw.githubusercontent.com/olmesm/odd-scripts/main/shell/asdf-install.sh | bash

# Copy the .env.example file and fill out the values in the .env
cp .env.example .env

# Login to GCP
gcloud auth login --no-launch-browser

# Login to GCP SDK
gcloud auth application-default login --no-launch-browser

### END FIRST RUN

# Setup local shell
. ./scripts/export-env.sh

# To Apply/Plan all
cd <environment>

# Init/Plan/Apply
# Note first apply may fail due to API's being enabled
terragrunt [init|plan|apply]
```

## Transfer image from ... to GCP

```bash
sh ./scripts/image-exchange.sh <tag> <location> <project> <artefact_repo> <image_name>
```

<!-- MARKDOWN REFERENCES -->

[asdf vm]: https://asdf-vm.com/
