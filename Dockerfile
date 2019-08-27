FROM jenkins/jnlp-slave:alpine

ARG NVM_VERSION=v0.34.0

# By default, the JNLP3-connect protocol is disabled due to known stability
# and scalability issues. You can enable this protocol using the
# JNLP_PROTOCOL_OPTS environment variable:
#
# JNLP_PROTOCOL_OPTS=-Dorg.jenkinsci.remoting.engine.JnlpProtocol3.disabled=false
#
# The JNLP3-connect protocol should be enabled on the Master instance as well.

ENV JNLP_PROTOCOL_OPTS=-Dorg.jenkinsci.remoting.engine.JnlpProtocol3.disabled=false

# Disable the JVM PerfDataFile feature by adding `-XX:-UsePerfData` to the
# `JAVA_OPTS` environment variable. Otherwise, a superfluous
# `/tmp/hsperfdata_root` directory will be included in the final Docker image.

ENV JAVA_OPTS -XX:-UsePerfData

# force Ash to source .profile
ENV ENV="$HOME/.profile"

# install nvm
RUN export NVM_DIR="$HOME/.nvm" && ( \
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"; \
    cd "$NVM_DIR"; \
    git checkout `git describe --abbrev=0 --tags --match "${NVM_VERSION}" $(git rev-list --tags --max-count=1)`; \
    ) && \. "$NVM_DIR/nvm.sh"

# update /home/jenkins/.profile
RUN command printf '# set nvm source directory and load nvm\n' >> $HOME/.profile
RUN command printf 'export NVM_DIR="$HOME/.nvm"\n' >> $HOME/.profile
RUN command printf '[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh"\n' >> $HOME/.profile
