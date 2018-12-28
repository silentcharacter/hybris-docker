FROM primetoninc/jdk:1.8

#Copy Hybris zip in container inside /src directory
COPY hybris.zip /src/hybris.zip

# Navigate to /src directory
WORKDIR /src

# Unzip hybris.zip
RUN unzip hybris.zip

RUN wget -O jrebel.zip http://dl.zeroturnaround.com/jrebel-stable-nosetup.zip && \
               unzip jrebel.zip && \
               mv jrebel /opt/jrebel && \
               rm jrebel.zip

# avalara tomcat
ADD apache-tomcat-8.5.37.tar.gz /src
WORKDIR /src/apache-tomcat-8.5.37
RUN find ./bin/ -name '*.sh' -exec sed -ri 's|^#!/bin/sh$|#!/usr/bin/env bash|' '{}' +; \
	chmod -R +rX .; \
	chmod 777 logs work
		   			   
# navigate to the platform directory
WORKDIR /src/hybris/bin/platform/

# Add exec permission to .sh files
RUN find ./ -type f -iname "*.sh" -exec chmod +x {} \;

COPY mysql-connector-java-5.1.46.jar lib/dbdriver/mysql-connector-java-5.1.46.jar7

COPY coreserver.jar ext/core/bin/coreserver.jar

# Expose http port
EXPOSE 9001

# Expose https port
EXPOSE 9002

# Expose solr port
EXPOSE 8983
EXPOSE 2198

# Expose Debug port
EXPOSE 8000

# Run ant  (also ant initialize if it's needed)
RUN . ./setantenv.sh && \
    sleep 5 && \
    echo develop | ant

# navigate to the directory
WORKDIR /src/hybris

# build-clean / build
ENV buildType build

# debug
ENV debug n

#initialize
ENV initialize n

RUN mkdir /src/hybris/bin/custom
VOLUME /src/hybris/bin/custom
VOLUME /src/hybris/config
VOLUME /src/hybris/data/media

# copy the wrapper script from host to container
COPY wrapperScript.sh /src/wrapperScript.sh
WORKDIR /src/

# Run wrapper script
CMD ["sh", "-c", "./wrapperScript.sh ${buildType} ${debug} ${initialize}"]

