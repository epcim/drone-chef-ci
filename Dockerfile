FROM jpetazzo/dind
MAINTAINER Petr Michalec <epcim@apealive.net>

RUN apt-get update
RUN apt-get install -qqy    curl \
                            sudo \
                            git \
                            mercurial \
                            subversion \
                            ca-certificates \
                            locales \
                            jq

RUN echo 'en_US.UTF-8 UTF-8'>>/etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive


## CHEF DK ###########################
RUN curl -L https://www.opscode.com/chef/install.sh | sudo bash -s -- -P chefdk
ENV PATH /opt/chefdk/bin:/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/embedded/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# Make Chef DK the primary Ruby/Chef development environment.
RUN echo 'eval "$(chef shell-init bash)"' >> ~/.bash_profile
RUN eval "$(chef shell-init bash)"


RUN chef gem install kitchen-docker


## FIX UP'S ##########################
RUN chmod -R 0440 /etc/sudoers
RUN chmod -R 0440 /etc/sudoers.d
# workaround (drone.io has no way yet to modify this image before git clone happens)
RUN git config --global http.sslverify false



VOLUME /var/lib/docker
CMD ["wrapdocker"]


