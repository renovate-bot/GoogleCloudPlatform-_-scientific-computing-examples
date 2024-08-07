#!/bin/bash
#
# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

REGION="us-central1"

#  gcloud artifacts repositories create (REPOSITORY : --location=LOCATION) --repository-format=REPOSITORY_FORMAT [optional flags]
#  optional flags may be  --allow-snapshot-overwrites | --async | --description |
#                         --disable-remote-validation | --help |
#                         --immutable-tags | --kms-key | --labels | --location |
#                         --mode | --remote-apt-repo | --remote-apt-repo-path |
#                         --remote-docker-repo | --remote-mvn-repo |
#                         --remote-npm-repo | --remote-password-secret-version |
#                         --remote-python-repo | --remote-repo-config-desc |
#                         --remote-username | --remote-yum-repo |
#                         --remote-yum-repo-path | --upstream-policy-file |
#                         --version-policy
#
gcloud artifacts repositories create \
  --location=${REGION} \
  --repository-format="docker" \
  mycustomimagerepo

# The Registry URL should take the form: "<region>-<format>.pkg.dev/<project>/<repo_name>"
# e.g., "us-central1-docker.pkg.dev/mycoolprojectname/mycustomimagerepo"
#
# or you can look it up using
#   gcloud artifacts repositories describe \
#     --location=${REGION} \
#     mycustomimagerepo

# Use this as the registry namespace tag for the images you build in order to push them up to the repo:
#   gcloud auth configure-docker us-central1-docker.pkg.dev
#   docker tag mycustomimage:latest us-central1-docker.pkg.dev/mycoolprojectname/mycustomimagerepo/mycustomimage:latest
#   docker push us-central1-docker.pkg.dev/mycoolprojectname/mycustomimagerepo/mycustomimage:latest

