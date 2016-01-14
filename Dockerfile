FROM centos

RUN yum install -y  git epel-release wget tmux
RUN yum install -y  moreutils-parallel

#Install latest docker engine
#
RUN curl -o /usr/local/bin/docker -fsSL `curl -fsSL https://github.com/docker/docker/releases/latest| grep -io '<a .*href=.*Linux\/x86_64.*>'| grep -v '.*tgz*' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d'`

#Install latest docker-machine
#
RUN curl -o /usr/local/bin/docker-machine -fsSL https://github.com/`curl -fsSL https://github.com/docker/machine/releases/latest| grep -io '<a .*href=.*linux-amd64.*>' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d'`

#Install latest docker-machine-driver-oneview
#
RUN curl -o /usr/local/bin/docker-machine-driver-oneview -fsSL https://github.com/`curl -fsSL https://github.com/HewlettPackard/docker-machine-oneview/releases/latest| grep -io '<a .*href=.*linux-amd64.*>' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d'`


#Install latest docker compose
#
RUN curl -o /usr/local/bin/docker-compose -fsSL https://github.com/`curl -fsSL https://github.com/docker/compose/releases/latest | grep -io '<a .*href=.*Linux-x86_64.*>'| grep -v '.*tgz*' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d'`

RUN chmod 755 /usr/local/bin/*

WORKDIR /root

ENV PATH=$PATH:/usr/local/go/bin

ENTRYPOINT /bin/bash
