FROM ubuntu:bionic

RUN apt update && apt install -y curl lsb-release gpg

RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y

# Install some dev tools
RUN apt install -y vim git

# Mount src to container
RUN mkdir /saas

# Save gcloud credentials on host box to avoid renegotiating OAuth2 tokens every time
RUN mkdir -p /root/.config/gcloud
VOLUME ["/root/.config/gcloud/", "/saas"]
