# saas_cloud_provider_benchmark
Benchmarking repo for GCP vs AWS

You should be able to edit the src both inside and outside the container as long as you
mount the volume correctly. See start_gcp_docker.sh for details.

## Steps

* Build the saas-gcp image using docker build (You only need to do this once)
```
docker build -t saas-gcp:latest .
```

* Get a shell inside the docker container (You should be inside this directory for this to work right)
```
./start_dcp_docker.sh
```

Voila! You should be good. You will see all the src files inside /saas.

## Using gcloud (inside the container)

* To login
gcloud auth login

All the login info is persisted inside the container as well as outside
$HOME/.config/gcloud. This is done so you don't have to login every time you hop inside
the container. However, remember to mount ``$HOME/.config/gcloud`` as volume with ``docker run -v``.

Example:

```
❯❯❯ docker run -it saas-gcp /bin/bash
root@96c372517b2b:/# gcloud auth list

No credentialed accounts.

To login, run:
  $ gcloud auth login `ACCOUNT`

root@96c372517b2b:/# exit
```

vs

```
docker run -v ~/.config/gcloud:/root/.config/gcloud -it saas-gcp /bin/bash
root@312e79eb0aa8:/# gcloud auth list
    Credentialed Accounts
ACTIVE  ACCOUNT
*       <REDACTED>

To set the active account, run:
    $ gcloud config set account `ACCOUNT`

root@312e79eb0aa8:/#
```