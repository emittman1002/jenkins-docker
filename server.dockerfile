# Build an agent for Java, Python, and Node builds
# ARG BASE_IMAGE_NAME=jenkins/jenkins:latest
ARG BASE_IMAGE_NAME=jenkins/jenkins:lts-jdk11

FROM --platform="${BUILDPLATFORM}" "${BASE_IMAGE_NAME}"

# Don't run setup wizard
ENV JENKINS_JAVA_OPTS=-Djenkins.install.runSetupWizard=false

# Preinstall some plugins
ENV PLUGINS_FILE=plugins.txt

USER root
COPY --chown=jenkins:jenkins ${PLUGINS_FILE} /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Setup security

# Set up other stuff
ENV JENKINS_URL=https://localhost:8080

# Install other stuff 
# for builds on master
# RUN apt-get update && \
# apt-get install -y maven && \
# apt-get install -y python3 && \
# apt-get install -y python3-venv && \
# apt-get install -y npm
 
