# Jenkins Agent NVM

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/nickolashkraus/jenkins-agent-nvm?color=blue)](https://cloud.docker.com/u/nickolashkraus/repository/docker/nickolashkraus/jenkins-agent-nvm)
[![MicroBadger Layers](https://images.microbadger.com/badges/image/nickolashkraus/jenkins-agent-nvm.svg)](https://microbadger.com/images/nickolashkraus/jenkins-agent-nvm)
[![MicroBadger Version](https://images.microbadger.com/badges/version/nickolashkraus/jenkins-agent-nvm.svg)](https://microbadger.com/images/nickolashkraus/jenkins-agent-nvm)
[![Releases](https://img.shields.io/github/v/release/NickolasHKraus/jenkins-agent-nvm?color=blue)](https://github.com/NickolasHKraus/jenkins-agent-nvm/releases)
[![MIT License](https://img.shields.io/github/license/NickolasHKraus/jenkins-agent-nvm?color=blue)](https://github.com/NickolasHKraus/jenkins-agent-nvm/blob/master/LICENSE)

[Docker Hub](https://cloud.docker.com/u/nickolashkraus/repository/docker/nickolashkraus/jenkins-agent-nvm)

Jenkins Agent NVM contains the [Jenkins Remoting](https://jenkins.io/projects/remoting/) library and [Node Version Manager](https://github.com/nvm-sh/nvm) (NVM). It can be used with [Amazon EC2 Container Service Plugin](https://wiki.jenkins.io/display/JENKINS/Amazon+EC2+Container+Service+Plugin) to build Docker images from a container running on an Amazon ECS cluster.

## What's in the image?

Jenkins Agent NVM contains the following images and utilities:

### `jenkins/jnlp-slave`

`jenkins/jnlp-slave` contains [Jenkins Remoting](https://github.com/jenkinsci/remoting), a library which implements the communication layer in Jenkins.

[Docker Hub](https://hub.docker.com/r/jenkins/jnlp-slave/) | [GitHub](https://github.com/jenkinsci/docker-jnlp-slave)

### `nvm-sh/nvm`

`nvm-sh/nvm` contains [Node Version Manager](https://github.com/nvm-sh/nvm) (NVM), a POSIX-compliant Bash script for managing multiple active Node.js versions.

[GitHub](https://github.com/nvm-sh/nvm)

## Usage

Jenkins Agent NVM can be run via Docker using the following command:

```bash
$ docker run \
  -it \
  --rm \
  -v ~/path/to/repository:/repository: \
  -w /repository \
  nickolashkraus/jenkins-agent-nvm:latest \
  /bin/sh
```

## Manually installing NVM

To manually install NVM, first clone [nvm-sh/nvm](https://github.com/nvm-sh/nvm) into `$HOME/.nvm`, and then load `nvm`:

```bash
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"
```

Then add the following lines to your `~/.bashrc`, `~/.profile`, or `~/.zshrc` file, so that `nvm` is automatically sourced upon login:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
