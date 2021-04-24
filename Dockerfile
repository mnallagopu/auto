FROM mnallago/jenkins:centos
COPY addjobs/ /usr/share/jenkins/ref/addjobs/
USER root
RUN chmod 777 -R /usr/share/jenkins/ref/addjobs
USER jenkins
WORKDIR /usr/share/jenkins/ref/addjobs/
RUN sleep 60
RUN bash gradlew rest --stacktrace -DbaseUrl=http://localhost:8080 -Dpattern=jobs/simple.groovy -Dusername=admin -Dpassword=admin