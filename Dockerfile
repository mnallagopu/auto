FROM mnallago/jenkins:centos

# Name the jobs  
ARG job_name_1="my_super_job"  
ARG job_name_2="my_ultra_job"

# Create the job workspaces  
RUN mkdir -p "$JENKINS_HOME"/workspace/${job_name_1}  
RUN mkdir -p "$JENKINS_HOME"/workspace/${job_name_2}

# Create the jobs folder recursively  
RUN mkdir -p "$JENKINS_HOME"/jobs/${job_name_1}  
RUN mkdir -p "$JENKINS_HOME"/jobs/${job_name_2}

# Add the custom configs to the container  
COPY /configs/${job_name_1}_config.xml "$JENKINS_HOME"/jobs/${job_name_1}/config.xml  
COPY /configs/${job_name_2}_config.xml "$JENKINS_HOME"/jobs/${job_name_2}/config.xml

# Create build file structure  
RUN mkdir -p "$JENKINS_HOME"/jobs/${job_name_1}/latest/  
RUN mkdir -p "$JENKINS_HOME"/jobs/${job_name_1}/builds/1/

# Create build file structure  
RUN mkdir -p "$JENKINS_HOME"/jobs/${job_name_2}/latest/  
RUN mkdir -p "$JENKINS_HOME"/jobs/${job_name_2}/builds/1/


# RUN 
# #RUN sleep 60
# #RUN curl http://localhost:8080
# RUN while ! curl -s -w '%{http_code}\n' 'localhost:8080';do echo waiting for missingfile;done
# COPY ./ /usr/share/jenkins/ref/auto/
# RUN ls -al

# USER root
# RUN chmod 777 -R /usr/share/jenkins/ref/auto
# USER jenkins
# WORKDIR /usr/share/jenkins/ref/auto/
# #RUN sleep 60
# RUN bash gradlew rest --stacktrace -DbaseUrl=http://localhost:8080 -Dpattern=jobs/simple.groovy -Dusername=admin -Dpassword=admin