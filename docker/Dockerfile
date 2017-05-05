FROM openjdk:7
MAINTAINER Patrick.Wang <233381335@qq.com>

#RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV ROOT /usr/local
RUN mkdir $ROOT/software $ROOT/app $ROOT/build

ENV TOMCAT_HOME $ROOT/app/tomcat

WORKDIR $ROOT/software
RUN  wget  -O tomcat.tar.gz http://mirrors.hust.edu.cn/apache/tomcat/tomcat-7/v7.0.77/bin/apache-tomcat-7.0.77.tar.gz \
&& tar -xvf tomcat.tar.gz \
&& rm tomcat.tar.gz \ 
&& mv apache-tomcat-7.0.77 $ROOT/app/tomcat

ENV PATH $TOMCAT_HOME/bin:$PATH

RUN echo ' tomcat-7.0.77 installed.'

RUN java -version

WORKDIR $ROOT/software 
RUN wget http://mirror.bit.edu.cn/apache/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz \
&& tar xzvf apache-maven-3.5.0-bin.tar.gz \
&& rm apache-maven-3.5.0-bin.tar.gz

ENV PATH $PATH:$ROOT/software/apache-maven-3.5.0/bin
RUN echo ' maven-3.5.0 installed.'
RUN mvn -version

RUN apt-get update
RUN apt-get install -y gawk
RUN echo 'awk installed.'
RUN apt-get install -y git
RUN echo 'git installed.'

ADD cd.sh $ROOT/app/
RUN chmod 777 $ROOT/app/cd.sh

EXPOSE 8080


ENTRYPOINT ["sh","/usr/local/app/cd.sh"] 


