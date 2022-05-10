# Build an agent for Java, Python, and Node builds
ARG BASE_IMAGE_NAME=jenkins/inbound-agent

FROM --platform="${BUILDPLATFORM}" "${BASE_IMAGE_NAME}"

# Install stuff
USER root
RUN apt-get update && \
	apt-get install -y maven && \
	apt-get install -y python3 && \
	apt-get install -y python3-venv && \
	apt-get install -y npm

ENV JENKINS_URL=https://localhost:8080
