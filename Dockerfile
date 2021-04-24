FROM mnallago/jenkins:centos
COPY ./ /usr/share/jenkins/ref/auto/
USER root
RUN chmod 777 -R /usr/share/jenkins/ref/addjobs
USER jenkins
WORKDIR /usr/share/jenkins/ref/auto/
RUN sleep 60
RUN bash gradlew rest --stacktrace -DbaseUrl=http://localhost:8080 -Dpattern=jobs/simple.groovy -Dusername=admin -Dpassword=admin