FROM ubuntu:14.04

ENV OPENGROK_INSTANCE_BASE /grok

RUN apt-get update
RUN apt-get install -y openjdk-7-jre-headless exuberant-ctags git subversion mercurial tomcat7 wget

ADD install.sh /usr/local/bin/install
RUN /usr/local/bin/install

ADD clone_openmw.sh /usr/local/bin/clone_openmw
RUN /usr/local/bin/clone_openmw

ADD run.sh /usr/local/bin/run
ENTRYPOINT ["/usr/local/bin/run"]

EXPOSE 8080
