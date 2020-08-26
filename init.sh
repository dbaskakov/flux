#!/bin/bash

helm upgrade -i helm-operator fluxcd/helm-operator --namespace flux \
--set helm.versions=v3 \
--set configureRepositories.enable=true \
--set configureRepositories.repositories[0].name=stable \
--set configureRepositories.repositories[0].url=https://kubernetescharts.storage.googleapis.com \
--set configureRepositories.repositories[1].name=helm-charts \
--set configureRepositories.repositories[1].url=https://raw.githubusercontent.com/dbaskakov/master \
--set logReleaseDiffs=true \
--set git.ssh.secretName=flux-git-deploy