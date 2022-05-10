# Build an agent for Java, Python, and Node builds

ARG BASE_IMAGE_NAME=jenkins/jenkins:latest

FROM --platform=${BUILDPLATFORM} ${BASE_IMAGE_NAME}

ARG JENKINS_PORT=8080
ARG JENKINS_AGENT_PORT=50000
ARG JENKINS_URL=http://localhost:${JENKINS_PORT}

ARG CASC_CONFIG_FILE=jenkins-server.yaml
ARG PLUGINS_FILE=plugins.txt

ARG ADMIN_USER_ID=unknown
ARG ADMIN_USER_PWD=unknown
ARG ADMIN_USER_NAME=unknown

# Environment configuration
ENV JENKINS_JAVA_OPTS=-Djenkins.install.runSetupWizard=false

ENV REF_PATH=/usr/share/jenkins/ref

ENV CASC_CONFIG_PATH=/var/jenkins_home
ENV CASC_JENKINS_CONFIG=${CASC_CONFIG_PATH}/${CASC_CONFIG_FILE}

ENV JENKINS_PORT=${JENKINS_PORT}
ENV JENKINS_AGENT_PORT=${JENKINS_AGENT_PORT}
ENV JENKINS_URL=${JENKINS_URL}

ENV ADMIN_USER_ID=${ADMIN_USER_ID}
ENV ADMIN_USER_PWD=${ADMIN_USER_PWD}
ENV ADMIN_USER_NAME=${ADMIN_USER_NAME}


USER root
# Install plugins
COPY --chown=jenkins:jenkins ${PLUGINS_FILE} ${REF_PATH}
RUN jenkins-plugin-cli --plugin-file ${REF_PATH}/${PLUGINS_FILE}
# Setup security and other stuff
COPY --chown=jenkins:jenkins ${CASC_CONFIG_FILE} ${CASC_CONFIG_PATH}

