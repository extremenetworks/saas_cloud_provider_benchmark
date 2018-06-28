#!/bin/bash

set -e

docker run -v ~/.config/gcloud:/root/.config/gcloud -v $PWD/src:/saas -it saas-gcp /bin/bash
