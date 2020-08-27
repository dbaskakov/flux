#!/bin/bash

helm upgrade -i flux fluxcd/flux \
   --set git.url=git@github.com:dbaskakov/flux \
   --set syncGarbageCollection.enabled=true \
   --namespace flux

fluxctl identity --k8s-fwd-ns flux

helm upgrade -i helm-operator fluxcd/helm-operator --namespace flux \
--set helm.versions=v3 \
--set configureRepositories.enable=true \
--set configureRepositories.repositories[0].name=stable \
--set configureRepositories.repositories[0].url=https://kubernetescharts.storage.googleapis.com \
--set configureRepositories.repositories[1].name=helm-charts \
--set configureRepositories.repositories[1].url=https://raw.githubusercontent.com/dbaskakov/master \
--set logReleaseDiffs=true \
--set git.ssh.secretName=flux-git-deploy