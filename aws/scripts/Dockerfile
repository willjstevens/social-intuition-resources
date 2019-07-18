FROM tomcat:8-jre9
MAINTAINER Someone

RUN apt-get update
RUN apt-get -y install less
RUN apt-get -y install sudo
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

RUN rm -Rf /usr/local/tomcat/webapps/ROOT
ADD ./ROOT.war /usr/local/tomcat/webapps/
ADD ./server.xml /usr/local/tomcat/conf/
ADD ./some-key-store /usr/local/tomcat/conf/
ADD ./.aws /root/.aws
CMD ["catalina.sh", "run"]
