FROM shipimg/ubuntu1204_base:latest

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl;
    
# See: http://rvm.io/support/faq#i-want-to-install-for-root-only
RUN echo 'export rvm_prefix="$HOME"' > /root/.rvmrc
RUN echo 'export rvm_path="$HOME/.rvm"' >> /root/.rvmrc
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable

# We are not i a login shell, so paths are not set (alternatively, we can invoke /bin/bash -l -c ...)
RUN /root/.rvm/bin/rvm install ruby-head
RUN /root/.rvm/bin/rvm install 1.8.7
RUN /root/.rvm/bin/rvm install 1.9.2
RUN /root/.rvm/bin/rvm install 1.9.3 && /root/.rvm/bin/rvm alias create default 1.9.3
RUN /root/.rvm/bin/rvm install 2.0.0
RUN /root/.rvm/bin/rvm install 2.1.1
RUN /root/.rvm/bin/rvm install jruby

# Install a default nodejs for the system
RUN add-apt-repository -y ppa:chris-lea/node.js && \
    apt-get update && \
    apt-get install -y nodejs;

# Force NVM_DIR so the installations go to the right place
ENV NVM_DIR /root/.nvm

# Install nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | bash

# Preinstall common node versions
RUN . /root/.nvm/nvm.sh && nvm install 0.8;
RUN . /root/.nvm/nvm.sh && nvm install 0.10;
RUN . /root/.nvm/nvm.sh && nvm install 0.11;
RUN . /root/.nvm/nvm.sh && nvm install 0.12;
RUN . /root/.nvm/nvm.sh && nvm alias default 0.10;

CMD [ "node" ]
